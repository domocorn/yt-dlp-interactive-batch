@echo off
setlocal EnableDelayedExpansion
title yt-dlp Interactive Downloader
color 0B

:: Default Settings: 1 is ON, 0 is OFF
set audio_only=0
set playlist=0
set subtitles=0
set metadata=0
:: Quality Settings: 0=Best, 1=1080p, 2=720p
set video_quality=1

:MENU
cls
echo ===================================================
echo           yt-dlp Interactive Downloader
echo ===================================================
echo Toggle your desired options by pressing the number:
echo.

if !audio_only!==1 (echo   [1] Audio Only - MP3....... [ ON ]) else (echo   [1] Audio Only - MP3....... [ OFF ])
if !playlist!==1 (echo   [2] Download Playlist...... [ ON ]) else (echo   [2] Download Playlist...... [ OFF ])
if !subtitles!==1 (echo   [3] Embed Subtitles........ [ ON ]) else (echo   [3] Embed Subtitles........ [ OFF ])
if !metadata!==1 (echo   [4] Embed Metadata/Art..... [ ON ]) else (echo   [4] Embed Metadata/Art..... [ OFF ])

:: Quality display string logic
if !video_quality!==0 set "vq_str=Best Available"
if !video_quality!==1 set "vq_str=1080p Maximum"
if !video_quality!==2 set "vq_str=720p Maximum "
echo   [5] Video Quality........ [ !vq_str! ]

echo.
echo   [D] Proceed to Download
echo   [Q] Quit Script
echo ===================================================
echo.
set /p "choice=Select an option: "

if /I "!choice!"=="1" (
    if !audio_only!==1 (set audio_only=0) else (set audio_only=1)
    goto MENU
)
if /I "!choice!"=="2" (
    if !playlist!==1 (set playlist=0) else (set playlist=1)
    goto MENU
)
if /I "!choice!"=="3" (
    if !subtitles!==1 (set subtitles=0) else (set subtitles=1)
    goto MENU
)
if /I "!choice!"=="4" (
    if !metadata!==1 (set metadata=0) else (set metadata=1)
    goto MENU
)
if /I "!choice!"=="5" (
    :: Cycle through 0, 1, 2
    set /a video_quality+=1
    if !video_quality! GTR 2 set video_quality=0
    goto MENU
)
if /I "!choice!"=="D" goto INPUT
if /I "!choice!"=="Q" goto END

goto MENU


:INPUT
cls
echo ===================================================
echo                 URL Input Phase
echo ===================================================
echo.
set "URL="
set /p "URL=Enter the link: "

if "!URL!"=="" goto MENU

:COMPILE_ARGS
set "ARGS="

if !audio_only!==1 set "ARGS=!ARGS! -x --audio-format mp3"
if !playlist!==1 (set "ARGS=!ARGS! --yes-playlist") else (set "ARGS=!ARGS! --no-playlist")
if !subtitles!==1 set "ARGS=!ARGS! --embed-subs --write-auto-subs"
if !metadata!==1 set "ARGS=!ARGS! --embed-metadata --embed-thumbnail"

:: Handle Quality Formatting (Enclosed safely in quotes for batch)
set "FORMAT=bv*+ba/b"
if !video_quality!==1 set "FORMAT=bv*[height<=1080]+ba/b"
if !video_quality!==2 set "FORMAT=bv*[height<=720]+ba/b"

:: Smart Audio Override: If Audio Only is ON, just fetch the best audio stream
if !audio_only!==1 set "FORMAT=ba/b"

echo.
echo [INFO] Compiling your selected arguments...
echo ---------------------------------------------------
echo Command: yt-dlp !ARGS! -f "!FORMAT!" "!URL!"
echo ---------------------------------------------------

:: Execute the command 
yt-dlp !ARGS! -f "!FORMAT!" "!URL!"

echo ---------------------------------------------------
echo [INFO] Process finished!
pause
goto MENU

:END
exit