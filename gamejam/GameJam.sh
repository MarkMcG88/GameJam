#!/bin/sh
echo -ne '\033c\033]0;GameJam\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/GameJam.x86_64" "$@"
