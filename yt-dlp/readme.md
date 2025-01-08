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

# for twitter support vcodec:h256, resolution:no-specific and audio:aac 
.\yt-dlp -v -S "vcodec:h264,res,acodec:aac" https://www.youtube.com/shorts/JbTB-gWOpFg

# ensure to download high quality
.\yt-dlp -f "bv*+ba/b" -S "vcodec:h264,res,acodec:aac" https://www.youtube.com/shorts/JbTB-gWOpFg

# download audio only
.\yt-dlp -x --audio-format mp3 [youtube-url]
```
##### ffmpeg
```ps1
./ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac output.mp4

# read file information
ffprobe "file name.mp4"

# list available files
ffmpeg -F url

# Extract videos frames at set intervals
# ex: frame_0001.jpg, fps= frame per second
ffmpeg -i input.mp4 -vf fps=1 frame_%04d.jpg
```
#### powershell
> sample
```ps1
Invoke-WebRequest -UseBasicParsing -Uri "[url]" -OutFile "[folder/file.mp4]" `
-UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0" `
-Headers @{
"Accept" = "video/webm,video/ogg,video/*;q=0.9,application/ogg;q=0.7,audio/*;q=0.6,*/*;q=0.5"
  "Accept-Language" = "en-US,en;q=0.5"
  "DNT" = "1"
  "Sec-GPC" = "1"
  "Referer" = "[referer-url]"
  "Sec-Fetch-Dest" = "video"
  "Sec-Fetch-Mode" = "no-cors"
  "Sec-Fetch-Site" = "cross-site"
  "Accept-Encoding" = "identity"
  "Priority" = "u=4"
}
```

