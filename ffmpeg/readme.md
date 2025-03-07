### window 
> argument
```ps1
# should " " around arg prevent space-name-file
$argBitrate = '-i "{0}" -c:v h264_nvenc  -b:v 1000k "{1}"' -f $oldVideo, $reduceBitrateName;
```
> multiple .ts file
```shell
type *.ts | ffmpeg -i pipe: -c:a copy output.mp4
```
#### Append
```ps1
# videoList.txt
file 'm 2.mp4'
file 'm 3.mp4'
# merge mp4
ffmpeg -f concat -safe 0 -i videoList.txt -c copy final_output2.mp4
```
#### Crop
```ps1
# crop and merge as one file (picture and video)
# aspect 4:3
ffmpeg -i 1.png -vf "crop=ih/3*4:ih:(iw-640)/2:(ih-360)/2" output_square.jpg
# get resolution
ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 3.jpg
# merge
ffmpeg -i 1.png -i 2.jpeg -i 3.jpeg -i 3.jpg -i 4.jpg -i 5.jpg -filter_complex "[0:v][1:v][2:v][3:v]xstack=inputs=6:layout=0_0|w0_0|w0+w1_0|0_h0|w0_h0|w0+w1_h0[v]" -map "[v]" output.jpeg

# crop hstack
ffmpeg -i 1.jpg -i 2.jpg -i 3.jpg -filter_complex `
"[0:v]crop=iw/2:ih:iw/4:0[left]; `
 [1:v]crop=iw/2:ih:iw/4:0[mid]; `
 [2:v]crop=iw/2:ih:iw/4:0[right]; `
 [left][mid][right]hstack=inputs=3,scale=720:-1" output4.jpg
```
#### Compression
```ps1
# -b:v 1000k: This sets the video bitrate to 1000 Kbps
ffmpeg -i eva.mp4 -c:v h264_nvenc  -b:v 1000k reduced_bitrate2.mp4
```
#### Chroma
```ps1
# chroma
ffmpeg -i main.mp4 -i overlay.mp4 -c:v h264_nvenc -filter_complex `
"[1:v]colorkey=020202:0.3:0.01[tmp]; `
[0:v][tmp]overlay" `
output02.mp4

# loop
ffmpeg -y -i main.mp4 -stream_loop -1 -i overlay.mp4 -c:v h264_nvenc -filter_complex `
"[0]overlay=x=0:y=0:shortest=1[out]" `
-map [out] -map 0:a? test.mp4

# loop x chroma
# -stream_loop -1 : specify video for loop forever
# shortest=1 : stop loop
ffmpeg -y -i main.mp4 -stream_loop -1 -i overlay.mp4 -c:v h264_nvenc -filter_complex `
"[1:v]colorkey=020202:0.3:0.01[tmp]; `
[0:v][tmp]overlay=x=0:y=0:shortest=1" `
output02.mp4
```
### powershell
> avoid one line string to multiple line use "@" as example below
```
$arg_hstack_picture = @'
-i "{0}" -i "{1}" -i "{2}" -filter_complex
"[0:v]{3}[left];
[1:v]{3}[mid];
[2:v]{3}[right];
[left][mid][right]hstack=inputs=3" {4}
'@
``` 
```ps1
# GPU support
# - CUDA
-hwaccel cuda (for CUDA acceleration)
-c:v h264_nvenc (for H.264 encoding with NVENC and reduce CPU performance but increase GPU performance)
# If x or y evaluate to a negative number, they will be changed so the input image is centered on the padded area.
-vf "pad=width=1280:height=720:x=-1:y=-1:color=black"

# 1280x720 : 1920x1080 : 1080x607.5 : 16x9
# cropping  
ffmpeg -hwaccel cuda -i input.mp4 -c:v h264_nvenc -vf "crop=(ih*9)/16:ih" output-xy2.mp4
# padding
ffmpeg -hwaccel cuda -i input.mp4 -c:v h264_nvenc -vf "pad=width=iw:height=2*ih:x=0:y=-1:color=black,crop=(ih*9)/16:ih" output-xy5.mp4
# overlay png
ffmpeg -hwaccel cuda -i output-xy5.mp4 -i mask.png -c:v h264_nvenc -filter_complex `
"[1]scale=iw+115:-1[in2];[0][in2]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" `
output5.mp4
```
