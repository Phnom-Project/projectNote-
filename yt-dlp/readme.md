### Linux
```shell
yt-dlp --no-abort-on-error -f "bv*+ba/b" --batch-file url.txt --no-overwrites --write-thumbnail --write-all-thumbnailsb
```
### Window
```ps1
# urls.txt
url1
url2
url3
# shell : have ffmpeg installed it will merge video and audio automatically
./yt-dlp --no-abort-on-error -f "bv*+ba/b" --batch-file url.txt --no-overwrites --write-thumbnail --write-all-thumbnails
```
##### ffmpeg
```ps1
./ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac output.mp4
```
