# ../powershell.ps1

# INPUT
# - source files
$inProcessPath = "D:\3ytest\ffmpeg\editor\test\"; # ex: D:\3ytest\ffmpeg\editor\test\
$musicFolder = "D:\3ytest\ffmpeg\editor\music\"; # ex: D:\3ytest\ffmpeg\editor\music\
$isReplaceMusic = $false; # false= amix

# VARIABLES
$path = "D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\";
$ffmpegPath = $path + "ffmpeg.exe";
$ffprobePath = $path + "ffprobe.exe"
# -file
$fileName_suffix_stage_change_music = "__scm.mp4";
$fileName_suffix_stage_fade_music = "__sfm.mp4";
$fileName_error = "error.txt";
$fileName_ffprobe = "ffprobe.txt";
# -folder
$folderName_scm = $inProcessPath + "scm/";
$folderName_sfm = $inProcessPath + "sfm/";
# GET
# - audio
$originalMusics = Get-ChildItem -Include @("*.mp3") `
    -Path $musicFolder"*";
# - video
$originalVideos =
Get-ChildItem -Include @("*.mp4") `
    -Path $inProcessPath"*";

# CREATE
# - folder
New-Item -Path $folderName_scm -ItemType Directory -ErrorAction stop;
New-Item -Path $folderName_sfm -ItemType Directory -ErrorAction stop;

# ⭐ SET Operation Location
Set-Location -Path $inProcessPath;
$index = 1;
foreach ($originalVideo in $originalVideos) {
    "Count: " + $index++ | Write-Host -ForegroundColor Blue;
    "video: " + $originalVideo | Write-Host -ForegroundColor Green;
    # GET: random start-position music
    # - random index music
    $originalMusics_randomKey = Get-Random -Minimum 0 -Maximum $originalMusics.Count;
    # - video
    $arg_ffprobe_duration_video =
    '-i "{0}" -show_entries format=duration -v quiet -of csv="p=0"' -f $originalVideo;
    Start-Process -FilePath $ffprobePath -ArgumentList $arg_ffprobe_duration_video `
        -Wait -NoNewWindow -RedirectStandardOutput $fileName_ffprobe;
    $get_ffprobe_duration_video = Get-Content -Path $fileName_ffprobe;
    $get_ffprobe_duration_video | Write-Host -ForegroundColor Green;
    # - music
    $fileName_music_after_random = $originalMusics[$originalMusics_randomKey];
    $arg_ffprobe_duration_music =
    '-i "{0}" -show_entries format=duration -v quiet -of csv="p=0"' -f $fileName_music_after_random;
    Start-Process -FilePath $ffprobePath -ArgumentList $arg_ffprobe_duration_music `
        -Wait -NoNewWindow -RedirectStandardOutput $fileName_ffprobe;
    $get_ffprobe_duration_music = Get-Content -Path $fileName_ffprobe;
    "music: " + $fileName_music_after_random | Write-Host -ForegroundColor Green;
    $get_ffprobe_duration_music | Write-Host -ForegroundColor Green;
    # - random start-position music
    $get_howManyTimes_video_equal_music_duration =
    [int]$get_ffprobe_duration_music / [int]$get_ffprobe_duration_video;
    "howManyTimes: " + [int]$get_howManyTimes_video_equal_music_duration | Write-Host -ForegroundColor Green;
    $value_startPosition_music = if ([int]$get_howManyTimes_video_equal_music_duration -le 1) { 0 }
    else {
        $_random_maximum = [int]$get_howManyTimes_video_equal_music_duration - 1 ;
        $_randomKey = Get-Random -Minimum 0 -Maximum $_random_maximum;
        [int]$get_ffprobe_duration_video * [int]$_randomKey;
    }
    "-ss: " + $value_startPosition_music | Write-Host -BackgroundColor Green;


    # 1 Stage: change music
    # - choose: amix or replace  
    $fileName_output_change_music = $originalVideo.BaseName + $fileName_suffix_stage_change_music;
    $fileName_output_fade_music = $originalVideo.BaseName + $fileName_suffix_stage_fade_music;
    $arg_change_music_amix = @'
    -loglevel error -i "{0}" -ss "{1}" -i "{2}" -c:v copy -filter_complex "
    [0:a] volume=0.5 [music];
    [music][1:a] amix=inputs=2:duration=shortest [audio_out]
    " -map 0:v -map "[audio_out]" -y "{3}"
'@ -f $originalVideo, $value_startPosition_music, $fileName_music_after_random, $fileName_output_change_music

    $arg_change_music_replace = @'
    -loglevel error -i "{0}" -ss "{1}" -i "{2}" -c:v copy -map 0:v -map 1:a -shortest "{3}"
'@ -f $originalVideo, $value_startPosition_music, $fileName_music_after_random, $fileName_output_change_music

    $arg_change_music =
    if ($isReplaceMusic) { $arg_change_music_replace }
    else { $arg_change_music_amix };
    # - ffmpeg: change music or amix
    try {
        Start-Process -FilePath $ffmpegPath -ArgumentList $arg_change_music `
            -Wait -NoNewWindow -RedirectStandardError $fileName_error;
        # -- ❗stop when have error from (ffmpeg)
        $error_check = Get-Content -Path $fileName_error -TotalCount 5 | Measure-Object -Line  | Select-Object -expand lines;
        if ($error_check -gt 0) {
            throw "FFMPEG(scm) have error, check {0}" -f $fileName_error;
        }
    }
    catch {
        Write-Error $_;
        break;
    }
    # 2 Stage: fade music
    # - ffmpeg: fade audio
    $value_fadeMusic_start = [int]$get_ffprobe_duration_video - 5;
    $arg_fade_music = @'
    -loglevel error -i "{0}" -c:v copy -af "afade=t=in:st=0:d=5,afade=t=out:st="{1}":d=5" "{2}"
'@ -f $fileName_output_change_music, $value_fadeMusic_start, $fileName_output_fade_music;
    try {
        Start-Process -FilePath $ffmpegPath -ArgumentList $arg_fade_music `
            -Wait -NoNewWindow -RedirectStandardError $fileName_error;
        # -- ❗stop when have error from (ffmpeg)
        $error_check = Get-Content -Path $fileName_error -TotalCount 5 | Measure-Object -Line  | Select-Object -expand lines;
        if ($error_check -gt 0) {
            throw "FFMPEG(sfm) have error, check {0}" -f $fileName_error;
        }
    }
    catch {
        Write-Error $_;
        break;
    }
    # MOVE
    # - scm
    $moveFiles = Get-ChildItem -Include @("*" + $fileName_suffix_stage_change_music) -Path $inProcessPath"*";
    foreach ($moveFile in $moveFiles) {
        Move-Item -Path $moveFile -Destination $folderName_scm -ErrorAction stop;
    }
    # -sfm
    $moveFiles = Get-ChildItem -Include @("*" + $fileName_suffix_stage_fade_music) -Path $inProcessPath"*";
    foreach ($moveFile in $moveFiles) {
        Move-Item -Path $moveFile -Destination $folderName_sfm -ErrorAction stop;
    }
}
