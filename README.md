# Icon resizer
Icon resizer automatically generates icons from a given image for Mac, iPhone, Android or Windows applications.

## Options
* **-f** – Filter to use for resizing (default: Cubic)
* **-h** – Display available options
* **-p** – Target platforms: mac, iphone, android, windows

## Usage
The following command generates icons for iPhone and windows from icon.png using Quadratic filter:
```
./resize_icon.sh icon.png -p iphone windows -f Quadratic
```