Video
=====

## Video Dimensions with 16:9
To fit the player perfectly, encode at these resolutions:

2160p: 3840x2160
1440p: 2560x1440
1080p: 1920x1080
720p: 1280x720
480p: 854x480
360p: 640x360
240p: 426x240

change video dimention:


```
ffmpeg -i input.flv -vf scale=1280x720 output2.flv
```

***

Duplicar audio channel, used when one side is mute

```
ffmpeg -i input.mp4 -vcodec copy -acodec libfaac -ab 220k -ar 48000 -ac 1 output.mp4
ffmpeg -i input.mp4 -acodec libfaac -ab 220k -ar 48000 -ac 1 output.mp4
```

flv para mp4
```
ffmpeg -i input.flv -c:v libx264 -crf 23 -c:a libfaac -q:a 100 output.mp4
```

```
for f in *\ *; do mv "$f" "${f// /_}"; done
mkdir mp4; for FILE_NAME in *.flv; do ffmpeg -i $FILE_NAME -c:v libx264 -crf 23 -c:a libfaac -q:a 100 mp4/"${FILE_NAME/%flv/mp4}"; done;
```

```
ffmpeg -i Aula_01_parte_03_-_Contabilidade_Geral_e_Avançada_-_Silvio_Sande.mp4 -vcodec copy -acodec libfaac -ab 220k -ar 48000 -ac 1 output.mp4
```

filesize (in MB) = (bitrate in Mbit/s / 8) * (video length in seconds)

# dont works
#ffmpeg -i input_file.avi -codec:v libx264 -profile: high -preset slow -b:v 500k -maxrate 500k -bufsize 1000k -vf scale=-1:480 -threads 0 -codec:a libfdk_aac -b:a 128k output_file.mp4

### trim audio or video (same thing)

The follow command will receive two parameters and return an audio trimmed.

The parameters receives numbers of seconds:

`-ss seconds` where will be made a cut at left side of the timeline

`-t seconds` duration in seconds of the trimmed audio.

Using the follow example, assuming the imput audio with duration of 3 minutes.
The return trimmed audio will trash the first 13 seconds and will have 94
seconds of duration.

```
ffmpeg -i brexit-song.m4v -ss 13 -t 94 -acodec copy trim4.m4v
```

# video from audio with images

making a new movie using an audio and an image as background.
```
ffmpeg -i img.png -i 10ways.m4a ep1.mp4
```

# change frame ratio of video (when 60 fps my mac cant do the job)

```
ffmpeg -i 01.mp4 -r 25 -s 1280x720 -c:v libx264 -b:v 3M
-strict -2 -movflags faststart 01_02.mp4
```
