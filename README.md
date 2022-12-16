# Icon resizer
Icon resizer automatically generates icons from a given image for Mac, iOS, Android or Windows applications.

# Dependencies

Icon resizer uses ImageMagick's convert command.

To install it with Homebrew on macOS, you have to type the following command in Terminal:
```sh
brew install imagemagick
```

Use `apt-get` to install ImageMagick on Ubuntu:
```sh
apt-get install imagemagick
```

## Options
* **-i** - Path to input image
* **-f** – Filter to use for resizing (default: Cubic)
* **-h** – Display available options
* **-p** – Target platforms: macos, ios, android, windows

## Usage
The following command generates icons for iOS and Windows from icon.png using Quadratic filter:
```sh
./resize_icon.sh -i icon.png -p ios windows -f Quadratic
```