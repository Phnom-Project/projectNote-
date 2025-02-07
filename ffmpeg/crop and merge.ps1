# ../powershell.ps1


# VARIABLES
$ffmpegPath = "D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe";
$ffprobePath = "D:\softwareInsteadDriveC\FFmpeg\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe";
# - source files
$inProcessPath = "D:\3ytest\ffmpeg\testx\";
$tmpFileFFProbeName = "ffprobeTmp.txt";
$errorFile = "error.txt"
# - folder
$setLocation_crop = $inProcessPath + "/crop/";
# - get childItem from folder
$oldPictures = Get-ChildItem -Include @("*.png", "*.jpeg", "*.jpg") -Path $inProcessPath  -Recurse;


# Create new folder
New-Item -Path $setLocation_crop -ItemType Directory


# Process location
Set-Location -Path $inProcessPath;


$index = 0;
foreach ($oldPicture in $oldPictures) {
    $index = $index + 1;
    $oldPicture | Write-Host -ForegroundColor Green
   
    # argument
    $argGetResolution = '-v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 {0}' -f $oldPicture;
    # get file resolution
    Start-Process -FilePath $ffprobePath -ArgumentList $argGetResolution -Wait -NoNewWindow -PassThru -RedirectStandardOutput $tmpFileFFProbeName;
    # - get value from file
    $pictureResolution = Get-Content -Path $tmpFileFFProbeName
    # - split text to array , ex: 4032x3024 (H x W)
    Write-Host $pictureResolution.Split("x")
    # crop image
    $x1 = $pictureResolution.Split("x")[0];
    $x2 = $pictureResolution.Split("x")[1];
    if ([int]$x1 -gt [int]$x2) {
        $x2 | Write-Host -ForegroundColor Magenta
        $argCrop = '-i {0} -vf "crop={1}:{1}" sqr{2}.jpg' -f $oldPicture, $x2 , $index;
    }
    else {
        $x1 | Write-Host -ForegroundColor Blue
        $argCrop = '-i {0} -vf "crop={1}:{1}" sqr{2}.jpg' -f $oldPicture, $x1 , $index;
    }
    Start-Process -FilePath $ffmpegPath -ArgumentList $argCrop -Wait -NoNewWindow -RedirectStandardOutput $errorFile;
    # move
    $croppedFile = $inProcessPath + "sqr" + $index + ".jpg";
    Move-Item -Path $croppedFile -Destination $setLocation_crop
    $croppedFile | Write-Host -ForegroundColor Yellow
}


# Merge
Set-Location -Path $setLocation_crop;
$croppedPic = Get-ChildItem -Include @("*.jpeg", "*.jpg") -Path $setLocation_crop  -Recurse;
# - argument
$strMerge = '-i {0} -i {1} -i {2} -i {3} -i {4} -i {5}' -f $croppedPic[0].name, $croppedPic[1].name, $croppedPic[2].name, $croppedPic[3].name, $croppedPic[4].name, $croppedPic[5].name ;
$strFilter = ' -filter_complex "[0:v][1:v][2:v][3:v]xstack=inputs=6:layout=0_0|w0_0|w0+w1_0|0_h0|w0_h0|w0+w1_h0[v]" -map "[v]" output.jpg'
$argMerge = $strMerge + $strFilter;
Start-Process -FilePath $ffmpegPath -ArgumentList $argMerge -Wait -NoNewWindow -RedirectStandardOutput $errorFile;
