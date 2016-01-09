if [ "$#" -ne 1 ] || [ ! -f "$1" ]; then
echo "Usage: resize_icon icon_file"
exit 1
fi

convert $1 -resize 29x29  Icon-29.png
convert $1 -resize 58x58  Icon-29@2x.png
convert $1 -resize 87x87  Icon-29@3x.png

convert $1 -resize 80x80  Icon-40@2x.png
convert $1 -resize 120x120  Icon-40@3x.png

convert $1 -resize 50x50  Icon-50.png
convert $1 -resize 100x100  Icon-50@2x.png

convert $1 -resize 57x57  Icon-57.png
convert $1 -resize 114x114  Icon-57@2x.png

convert $1 -resize 120x120  Icon-60@2x.png
convert $1 -resize 180x180  Icon-60@3x.png

convert $1 -resize 72x72  Icon-72.png
convert $1 -resize 144x144  Icon-72@2x.png

convert $1 -resize 76x76  Icon-76.png
convert $1 -resize 152x152  Icon-76@2x.png

convert $1 -resize 167x167  Icon-83.5@2x.png
