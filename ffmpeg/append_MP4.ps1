# ../powershell.ps1

# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - source files
$inProcessPath = "D:\3ytest\yt-dlp\test_append";
# - ensure this folder exists
$setLocation_append = $inProcessPath + "/append/";
# - file name
$fileName_append = "append.mp4"
$fileName_videoList = "videoList.txt"
# - get childItem from folder
$oldVideos =
Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv") `
    -Path $inProcessPath -Recurse;

# create new folder
New-Item -Path $setLocation_append -ItemType Directory

# output location
Set-Location -Path $inProcessPath;

# CONDITION
# - check number of files
if ($oldVideos.Count -gt 10) {
    Write-Host -ForegroundColor Yellow "A lot videos not allowed !" $oldVideos.Count
    exit
}

# Insert video path to text-file
foreach ($oldVideo in $oldVideos) {
    $oldVideo | Write-Host -ForegroundColor Green
    # append video path
    "file " + "'" + $oldVideo.name + "'" | Add-Content $fileName_videoList
}

# FFMPEG
# - arguments
$arg_appendMP4 = '-f concat -safe 0 -i "{0}" -c copy "{1}"' -f $fileName_videoList, $fileName_append;
# - append mp4
Start-Process -FilePath $ffmpegPath -ArgumentList $arg_appendMP4 -Wait -NoNewWindow;


# # MOVE
$appendMP4 = Get-ChildItem -Include @($fileName_append) -Path $inProcessPath -Recurse;
Move-Item -Path $appendMP4 -Destination $setLocation_append
