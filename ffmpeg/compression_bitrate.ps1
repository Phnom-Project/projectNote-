# ../powershell.ps1

# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - source files
$inProcessPath = "D:\MMo\Sweetatoo\website\1\Eva (eva_fashionista)\0video\3";
# - ensure this folder exists
$setLocation_compress = $inProcessPath + "/compress/";
# - name
$reduceBitrateName = "reduced_bitrate.mp4";

# get childItem from folder
$oldVideos = Get-ChildItem -Include @("*.mp4", "*.avi", "*.divx", "*.mov", "*.mpg", "*.wmv", "*.mkv") -Path $inProcessPath -Recurse;
# $imageMask = Get-ChildItem -Include @("*.png") -Path $imageMaskPath -Recurse;

# create new folder
New-Item -Path $setLocation_compress -ItemType Directory

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
    $argBitrate = '-i "{0}" -c:v h264_nvenc  -b:v 1000k "{1}"' -f $oldVideo, $reduceBitrateName;
    # Pause the script until user hits enter
    $null = Read-Host -Prompt 'Press enter to continue, after verifying command line arguments.';


    # compression
    Start-Process -FilePath $ffmpegPath -ArgumentList $argBitrate -Wait -NoNewWindow;
}

# MOVE
# - move file
$shorts = Get-ChildItem -Include @($reduceBitrateName) -Path $inProcessPath -Recurse;
foreach ($short in $shorts) {
    Move-Item -Path $short -Destination $setLocation_compress
}
