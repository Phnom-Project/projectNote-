# ../powershell.ps1

# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - source files
$inProcessPath = "D:\3ytest\yt-dlp\test";
# $imageMaskPath = "D:\3ytest\yt-dlp\mask";
# - ensure this folder exists
$setLocation_short = $inProcessPath + "/short/";
# - name
$padAndCropName = "padAndCrop.mp4";
# $maskName = "mask.mp4";
$splitVideoName = "fff%d.mp4";
$shortVideoMoveFormat = "fff*.mp4";

# get childItem from folder
$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv") -Path $inProcessPath -Recurse;
# $imageMask = Get-ChildItem -Include @("*.png") -Path $imageMaskPath -Recurse;

# create new folder
New-Item -Path $setLocation_short -ItemType Directory

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
    $argPadAndCrop = '-hwaccel cuda -i "{0}" -c:v h264_nvenc -vf "pad=width=iw:height=2*ih:x=0:y=-1:color=black,crop=(ih*9)/16:ih" {1}' -f $oldVideo, $padAndCropName;
    # $argMask = '-hwaccel cuda -i {0} -i {1} -c:v h264_nvenc -filter_complex "[1]scale=iw+115:-1[in2];[0][in2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" {2}' -f $padAndCropName, $imageMask[0], $maskName;
    # - 58 seconds
    $argSplit = '-i {0} -acodec copy -f segment -segment_time 58 -vcodec copy -reset_timestamps 1 -map 0 {1}' -f $padAndCropName, $splitVideoName;
    # Pause the script until user hits enter
    $null = Read-Host -Prompt 'Press enter to continue, after verifying command line arguments.';

    # pad and crop
    Start-Process -FilePath $ffmpegPath -ArgumentList $argPadAndCrop -Wait -NoNewWindow;
    # mask
    # Start-Process -FilePath $ffmpegPath -ArgumentList $argMask -Wait -NoNewWindow;
    # split
    Start-Process -FilePath $ffmpegPath -ArgumentList $argSplit -Wait -NoNewWindow;

    # remove temp files
    # Remove-Item -Path $padAndCropName, $maskName -Recurse -Force;
}

# MOVE
# - move file
$shorts = Get-ChildItem -Include @($shortVideoMoveFormat) -Path $inProcessPath -Recurse;
foreach ($short in $shorts) {
    Move-Item -Path $short -Destination $setLocation_short
}
