# ../powershell.ps1


# INPUT
# - source files
$inProcessPath = "D:\MMo\Sweetatoo\website\1\Anna Malygon\0video\1\append\thumb\hstack"; # D:\M\4
$isLandscape = $false;
# VARIABLES
$ffmpegPath =
"D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
# - file name
$fileName_output = "hstack.jpg"
# - get childItem from folder
$oldVideos =
Get-ChildItem -Include @("*.png", "*.jpg", "*.jpeg") `
    -Path $inProcessPath -Recurse;

# output location
Set-Location -Path $inProcessPath;

# CONDITION
# - check number of files
if ($oldVideos.Count -gt 3) {
    Write-Host -ForegroundColor Yellow "number object not allowed !" $oldVideos.Count
    exit
}
Write-Host -ForegroundColor Green $oldVideos[0].Name
# FFMPEG
$var_crop =
if ($isLandscape) { 'crop=iw/4:ih:(iw/2)-(iw/8):0,scale=-1:1280' }
else { 'crop=(iw*3)/4:(ih*5)/6:(iw)/4:(ih)/10,scale=-1:1280' };
# - arguments
$arg_hstack_picture = @'
-i "{0}" -i "{1}" -i "{2}" -filter_complex
"[0:v]{3}[left];
[1:v]{3}[mid];
[2:v]{3}[right];
[left][mid][right]hstack=inputs=3" {4}
'@ -f $oldVideos[0].Name, $oldVideos[1].Name, $oldVideos[2].Name, $var_crop, $fileName_output;
# - hstack picture
Start-Process -FilePath $ffmpegPath -ArgumentList $arg_hstack_picture -Wait -NoNewWindow;
