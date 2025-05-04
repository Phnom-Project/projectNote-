# ../powershell.ps1


# INPUT
# - source files
$inProcessPath = "D:\MMo\Sweetatoo\website\1\Ashley Carolina\0video\5\mixed"; # D:\M\4
$inHaveWatermark = $false;
$inResolution = 720; # 1080, 720, 480
# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - file name
$fileName_output = "removed_watermark.mp4"
# - get childItem from folder
$oldVideos =
Get-ChildItem -Include @("*.mp4") `
    -Path $inProcessPath -Recurse;

# output location
Set-Location -Path $inProcessPath;

# CONDITION
# - check number of files
if ($oldVideos.Count -gt 1) {
    Write-Host -ForegroundColor Yellow "number object not allowed !" $oldVideos.Count
    exit
}
Write-Host -ForegroundColor Green $oldVideos[0].Name
# FFMPEG
$var_resolution_multi =
if($inResolution -eq 1080) {1080/1080}
elseif ($inResolution -eq 720) {1080/720}
elseif ($inResolution -eq 480) {1080/480}
else {
    Write-Host -ForegroundColor Yellow "number object not allowed !"
    exit
}
# - arguments
$arg_removeWatermark =
if($inHaveWatermark){
@'
-i {0} -vf "delogo=x=50/{2}:y=50/{2}:w=220/{2}:h=120/{2}:show=0,
delogo=x=800/{2}:y=1750/{2}:w=220/{2}:h=120/{2}:show=0" -c:a copy {1}
'@ -f $oldVideos[0].Name, $fileName_output, $var_resolution_multi;
}
else{
@'
-i {0} -vf "delogo=x=50:y=50:w=0:h=0:show=0" -c:a copy {1}
'@ -f $oldVideos[0].Name, $fileName_output;
}

# - remove watermark
Start-Process -FilePath $ffmpegPath -ArgumentList $arg_removeWatermark -Wait -NoNewWindow;
