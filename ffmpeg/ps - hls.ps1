# ../powershell.ps1


# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - source files
$inProcessPath = "D:\MMo\Sweetatoo\website\1\Ashley Carolina\0video\5\mixed\rw"; # D:\M\4
$inHLS_time = 5; # segment to second
$inThumb_time = 0.5; # 0.1 : 10s, 0.5 : 5s (0.1fps 10second take 1frame)
# - ensure this folder exists
$setLocation_thumbnail = $inProcessPath + "/thumb/";
$setLocation_m3u8 = $inProcessPath + "/m3u8/";
# - get childItem from folder
$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv") -Path $inProcessPath -Recurse;

# create new folder
New-Item -Path $setLocation_thumbnail -ItemType Directory
New-Item -Path $setLocation_m3u8 -ItemType Directory

# output location
Set-Location -Path $inProcessPath;

# CONDITION
# - check number of files
if ($oldVideos.Count -gt 1) {
    Write-Host -ForegroundColor Yellow "Multiple videos not allowed !" $oldVideos.Count
    exit
}

# FFMPEG
# recursive
foreach ($oldVideo in $oldVideos) {
    $oldVideo | Write-Host -ForegroundColor Green
    # argument
    $argExtractFrame = '-i "{0}" -vf fps={1} frame_%04d.jpg' -f $oldVideo,$inThumb_time;
    $arg_mp4_to_m3u8 = '-hwaccel cuda -i "{0}" -codec: copy -start_number 0 -hls_time {1} -hls_list_size 0 -f hls filename.m3u8' -f $oldVideo, $inHLS_time;
    # Pause the script until user hits enter
    $null = Read-Host -Prompt 'Press enter to continue, after verifying command line arguments.';
    # Extract frame from video
    Start-Process -FilePath $ffmpegPath -ArgumentList $argExtractFrame -Wait -NoNewWindow;
    # convert mp4 to HLS
    Start-Process -FilePath $ffmpegPath -ArgumentList $arg_mp4_to_m3u8 -Wait -NoNewWindow;
}

# MOVE
# - move thumbnail file
$thumbnails = Get-ChildItem -Include @("*.jpg") -Path $inProcessPath -Recurse;
foreach ($thumbnail in $thumbnails) {
    Move-Item -Path $thumbnail -Destination $setLocation_thumbnail
}
# - move .m3u8 and .ts
$thumbnails = Get-ChildItem -Include @("*.m3u8", "*.ts") -Path $inProcessPath -Recurse;
foreach ($thumbnail in $thumbnails) {
    Move-Item -Path $thumbnail -Destination $setLocation_m3u8
}
