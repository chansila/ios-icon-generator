set -e

SRC_FILE="$1"
DST_PATH="$2"

VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script aim to generate ios app icons easier and simply.

    srcfile - The source png image. Preferably above 1024x1024
    dstpath - The destination path where the icons generate to.

    This script is depend on ImageMagick. So you must install ImageMagick first
    You can use 'sudo brew install ImageMagick' to install it

AUTHOR:
    Pawpaw<lvyexuwenfa100@126.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png ~/123
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. Please use brew to install it first."; exit -1; }

# Check param
if [ $# != 2 ];then
    usage
    exit -1
fi

# Check dst path whether exist.
if [ ! -d "$DST_PATH" ];then
    mkdir -p "$DST_PATH"
fi

# Generate, refer to:https://developer.apple.com/library/ios/qa/qa1686/_index.html

info 'Generate IOS Icon'
mkdir -p "$DST_PATH/ios"

info 'Generate iTunesArtwork.png ...'
convert "$SRC_FILE" -resize 512x512 "$DST_PATH/ios/iTunesArtwork.png"
info 'Generate iTunesArtwork@2x.png ...'
convert "$SRC_FILE" -resize 1024x1024 "$DST_PATH/ios/iTunesArtwork@2x.png"

info 'Generate Icon-20.png ...'
convert "$SRC_FILE" -resize 20x20 "$DST_PATH/ios/Icon-20.png"
info 'Generate Icon-20@2x.png ...'
convert "$SRC_FILE" -resize 40x40 "$DST_PATH/ios/Icon-20@2x.png"
info 'Generate Icon-40@2x.png ...'
convert "$SRC_FILE" -resize 60x60 "$DST_PATH/ios/Icon-20@3x.png"

info 'Generate Icon-29.png ...'
convert "$SRC_FILE" -resize 29x29 "$DST_PATH/ios/Icon-29.png"
info 'Generate Icon-29@2x.png ...'
convert "$SRC_FILE" -resize 58x58 "$DST_PATH/ios/Icon-29@2x.png"
info 'Generate Icon-29@3x.png ...'
convert "$SRC_FILE" -resize 87x87 "$DST_PATH/ios/Icon-29@3x.png"

info 'Generate Icon-40.png ...'
convert "$SRC_FILE" -resize 40x40 "$DST_PATH/ios/Icon-40.png"
info 'Generate Icon-40@2x.png ...'
convert "$SRC_FILE" -resize 80x80 "$DST_PATH/ios/Icon-40@2x.png"
info 'Generate Icon-40@3x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/ios/Icon-40@3x.png"

info 'Generate Icon-60.png ...'
convert "$SRC_FILE" -resize 60x60 "$DST_PATH/ios/Icon-60.png"
info 'Generate Icon-60@2x.png ...'
convert "$SRC_FILE" -resize 120x120 "$DST_PATH/ios/Icon-60@2x.png"
info 'Generate Icon-60@3x.png ...'
convert "$SRC_FILE" -resize 180x180 "$DST_PATH/ios/Icon-60@3x.png"

info 'Generate Icon-76.png ...'
convert "$SRC_FILE" -resize 76x76 "$DST_PATH/ios/Icon-76.png"
info 'Generate Icon-76@2x.png ...'
convert "$SRC_FILE" -resize 152x152 "$DST_PATH/ios/Icon-76@2x.png"

info 'Generate Icon-57.png ...'
convert "$SRC_FILE" -resize 57x57 "$DST_PATH/ios/Icon-57.png"
info 'Generate Icon-57@2x.png ...'
convert "$SRC_FILE" -resize 114x114 "$DST_PATH/ios/Icon-57@2x.png"

info 'Generate Icon-83.5@2x.png ...'
convert "$SRC_FILE" -resize 167x167 "$DST_PATH/ios/Icon-83.5@2x.png"

info 'Generate Icon-72.png ...'
convert "$SRC_FILE" -resize 72x72 "$DST_PATH/ios/Icon-72.png"
info 'Generate Icon-72@2x.png ...'
convert "$SRC_FILE" -resize 144x144 "$DST_PATH/ios/Icon-72@2x.png"

info 'Generate Icon-50.png ...'
convert "$SRC_FILE" -resize 50x50 "$DST_PATH/ios/Icon-50.png"
info 'Generate Icon-50@2x.png ...'
convert "$SRC_FILE" -resize 100x100 "$DST_PATH/ios/Icon-50@2x.png"

info 'Generate Android Icon'
mkdir -p "$DST_PATH/android"

info 'Generate playstore-icon.png ...'
convert "$SRC_FILE" -resize 512x512 "$DST_PATH/android/playstore-icon.png"

info 'Generate Icon-mdpi ...'
mkdir -p "$DST_PATH/android/mipmap-mdpi"
convert "$SRC_FILE" -resize 48x48 "$DST_PATH/android/mipmap-mdpi/ic_launcher.png"

info 'Generate Icon-hdpi ...'
mkdir -p "$DST_PATH/android/mipmap-hdpi"
convert "$SRC_FILE" -resize 72x72 "$DST_PATH/android/mipmap-hdpi/ic_launcher.png"

info 'Generate Icon-xhdpi ...'
mkdir -p "$DST_PATH/android/mipmap-xhdpi"
convert "$SRC_FILE" -resize 96x96 "$DST_PATH/android/mipmap-xhdpi/ic_launcher.png"

info 'Generate Icon-xxhdpi ...'
mkdir -p "$DST_PATH/android/mipmap-xxhdpi"
convert "$SRC_FILE" -resize 144x144 "$DST_PATH/android/mipmap-xxhdpi/ic_launcher.png"

info 'Generate Icon-xxxhdpi ...'
mkdir -p "$DST_PATH/android/mipmap-xxxhdpi"
convert "$SRC_FILE" -resize 192x192 "$DST_PATH/android/mipmap-xxxhdpi/ic_launcher.png"

info 'Generate Done.'
