# yt-dlp Interactive Batch Menu

A lightweight, interactive Windows Batch script that provides a simple command-line GUI for `yt-dlp`. 

Instead of typing out long strings of arguments every time you want to download a video, this script allows you to toggle your most-used settings on the fly using a simple number menu. It's a perfect, portable tool for IT technicians, data hoarders, or anyone who wants quick, hassle-free media archiving.

## ✨ Features
* **Interactive Menu:** Easily toggle options ON or OFF before pasting your link.
* **Smart Audio Extraction:** Convert downloads directly to MP3. Automatically overrides video quality settings to save bandwidth when downloading audio-only.
* **Quality Selector:** Cycle between downloading the Best Available quality, capped at 1080p, or capped at 720p.
* **Metadata & Subtitles:** One-click toggles to embed thumbnails, video descriptions, and auto-generated subtitles directly into the file.
* **Playlist Support:** Choose whether to download a single video or an entire playlist.
* **Crash Proof:** Wraps URLs in quotes to prevent batch crashes caused by `&` symbols in YouTube links.

## 🛠️ Prerequisites
To use this script, you need two standard open-source tools installed on your Windows machine:
1. **[yt-dlp](https://github.com/yt-dlp/yt-dlp/releases)** - The core downloading engine.
2. **[FFmpeg](https://ffmpeg.org/download.html)** - Required by `yt-dlp` for post-processing (converting to MP3, embedding metadata/subtitles, etc.).

*Note: For the script to work out of the box, make sure `yt-dlp.exe` and `ffmpeg.exe` are either in the exact same folder as this batch script, or added to your system's `PATH` environment variable.*

## 🚀 Installation & Usage
1. Download the `youtubeVideoDownloader.bat` file from this repository.
2. Place it in the folder where you want your media to be downloaded.
3. Double-click the `.bat` file to run it. 
4. Type the corresponding numbers to toggle your desired settings.
5. Press `D` to proceed, paste your video or playlist URL, and hit Enter.

## 👤 Author
Created by Dominic.
