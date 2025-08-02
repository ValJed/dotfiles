#!/usr/bin/env python3
"""
Video Subtitle Embedder
Adds subtitles to video files using FFmpeg
"""

import argparse
import os
import subprocess
import sys
from pathlib import Path


def check_ffmpeg():
    """Check if FFmpeg is installed and accessible"""
    try:
        subprocess.run(
            ["ffmpeg", "-version"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=True,
        )
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        return False


def add_subtitles(video_path, subtitle_path, output_path=None, subtitle_style=None):
    """
    Add subtitles to a video file

    Args:
        video_path (str): Path to input video file
        subtitle_path (str): Path to subtitle file (.srt, .ass, .vtt)
        output_path (str): Path for output video (optional)
        subtitle_style (dict): Subtitle styling options (optional)
    """

    # Validate input files
    if not os.path.exists(video_path):
        raise FileNotFoundError(f"Video file not found: {video_path}")

    if not os.path.exists(subtitle_path):
        raise FileNotFoundError(f"Subtitle file not found: {subtitle_path}")

    # Generate output filename if not provided
    if output_path is None:
        video_stem = Path(video_path).stem
        video_dir = Path(video_path).parent
        output_path = video_dir / f"{video_stem}_with_subtitles.mp4"

    # Build FFmpeg command
    cmd = ["ffmpeg", "-i", video_path, "-vf", f"subtitles='{subtitle_path}'"]

    # Add subtitle styling if provided
    if subtitle_style:
        style_options = []
        if "font_size" in subtitle_style:
            style_options.append(
                f"force_style='FontSize={subtitle_style['font_size']}'"
            )
        if "font_name" in subtitle_style:
            style_options.append(
                f"force_style='FontName={subtitle_style['font_name']}'"
            )
        if "primary_color" in subtitle_style:
            style_options.append(
                f"force_style='PrimaryColour={subtitle_style['primary_color']}'"
            )

        if style_options:
            cmd[-1] += ":" + ":".join(style_options)

    # Add output options
    cmd.extend(
        [
            "-c:a",
            "copy",  # Copy audio without re-encoding
            "-y",  # Overwrite output file if it exists
            str(output_path),
        ]
    )

    return cmd, output_path


def main():
    parser = argparse.ArgumentParser(
        description="Add subtitles to video files using FFmpeg",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python subtitle_embedder.py video.mp4 subtitles.srt
  python subtitle_embedder.py video.mp4 subtitles.srt -o output.mp4
  python subtitle_embedder.py video.mp4 subtitles.srt --font-size 24 --font-name Arial
        """,
    )

    parser.add_argument("video", help="Input video file")
    parser.add_argument("subtitles", help="Subtitle file (.srt, .ass, .vtt)")
    parser.add_argument(
        "-o",
        "--output",
        help='Output video file (default: adds "_with_subtitles" to input name)',
    )
    parser.add_argument("--font-size", type=int, help="Subtitle font size")
    parser.add_argument("--font-name", help="Subtitle font name")
    parser.add_argument(
        "--font-color", help="Subtitle color (hex format, e.g., &H00FFFFFF for white)"
    )
    parser.add_argument(
        "--verbose", "-v", action="store_true", help="Show FFmpeg output"
    )

    args = parser.parse_args()
    print(args)

    # Check if FFmpeg is available
    if not check_ffmpeg():
        print("Error: FFmpeg is not installed or not found in PATH")
        print("Please install FFmpeg: https://ffmpeg.org/download.html")
        sys.exit(1)

    # Prepare subtitle styling
    subtitle_style = {}
    if args.font_size:
        subtitle_style["font_size"] = args.font_size
    if args.font_name:
        subtitle_style["font_name"] = args.font_name
    if args.font_color:
        subtitle_style["primary_color"] = args.font_color

    try:
        # Build command and get output path
        cmd, output_path = add_subtitles(
            args.video,
            args.subtitles,
            args.output,
            subtitle_style if subtitle_style else None,
        )

        print(f"Adding subtitles to: {args.video}")
        print(f"Using subtitle file: {args.subtitles}")
        print(f"Output will be saved to: {output_path}")

        if args.verbose:
            print(f"FFmpeg command: {' '.join(cmd)}")

        # Execute FFmpeg command
        if args.verbose:
            result = subprocess.run(cmd, check=True)
        else:
            result = subprocess.run(
                cmd,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.PIPE,
                check=True,
                text=True,
            )

        print(f"✓ Success! Video with subtitles saved to: {output_path}")

    except FileNotFoundError as e:
        print(f"Error: {e}")
        sys.exit(1)
    except subprocess.CalledProcessError as e:
        print(f"Error: FFmpeg failed to process the video")
        if hasattr(e, "stderr") and e.stderr:
            print(f"FFmpeg error: {e.stderr}")
        sys.exit(1)
    except KeyboardInterrupt:
        print("\nOperation cancelled by user")
        sys.exit(1)


if __name__ == "__main__":
    main()
