# ../powershell.ps1
# hstack_pic


# INPUT
# - source files
$inProcessPath = "D:\MMo\website\1\0video\3\mixed\rw\thumb\select"; # D:\M\4
$isLandscape = $false;
$iPosition = 2; # 1left 2middle 3right
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
$var_position =
if($iPosition -eq 1){'0'}
elseif($iPosition -eq 3){'(iw/2)+(iw/8)'}
else{'(iw/2)-(iw/8)'}


$var_crop =
if ($isLandscape) { 'crop=iw/4:ih:"{0}":0,scale=-1:1280' -f $var_position }
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

