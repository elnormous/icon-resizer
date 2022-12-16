TARGET_MACOS=true
TARGET_IOS=true
TARGET_ANDROID=true
TARGET_WINDOWS=true

FILTER=Cubic
INPUT_FILE=""

function printHelp {
    echo "OVERVIEW: Resizes given image"
    echo ""
    echo "USAGE: $0 <icon file> [options]"
    echo ""
    echo "OPTIONS:"
    echo "	-f <filter>			Filter to use for resizing (default: Cubic)"
    echo "	-h				Display available options"
    echo "	-p <platforms>			Target platforms: macos, ios, android, windows, all"
    exit
}

if ! command -v convert &> /dev/null
then
    echo "ImageMagick not installed"
    exit
fi

if [ -n "$1" ]
then
    CURRENT_ARG=0
    INPUT_FILE="$1"

    for arg in "${@:2}"
    do
        case $arg in
            "-p")
                CURRENT_ARG=1
                TARGET_MACOS=false
                TARGET_IOS=false
                TARGET_ANDROID=false
                TARGET_WINDOWS=false
                ;;
            "-f")
                CURRENT_ARG=2
                ;;
            "--help"|"-h")
                printHelp
                ;;
            *)
                case $CURRENT_ARG in
                    1)
                        case $arg in
                            "macos")
                                TARGET_MACOS=true
                                ;;
                            "ios")
                                TARGET_IOS=true
                                ;;
                            "android")
                                TARGET_ANDROID=true
                                ;;
                            "windows")
                                TARGET_WINDOWS=true
                                ;;
                            "all")
                                TARGET_MACOS=true
                                TARGET_IOS=true
                                TARGET_ANDROID=true
                                TARGET_WINDOWS=true
                                ;;
                            *)
                                echo "Invalid argument \"$arg\""
                                exit 1
                                ;;
                            esac
                        ;;
                    2)
                        FILTER=$arg
                        ;;
                    *)
                        echo "Invalid argument \"$arg\""
                        exit 1
                        ;;
                esac
                ;;
        esac
    done
fi

if [ -z "$INPUT_FILE" ]; then
    echo "No input file provided"
    exit 1
fi

if [ "$TARGET_MACOS" = false ] && [ "$TARGET_IOS" = false ] && [ "$TARGET_ANDROID" = false ] && [ "$TARGET_WINDOWS" = false ]
then
    echo "No platforms provided"
    exit 1
fi

if [ "$TARGET_MACOS" = true ]
then
    if [ ! -d "macos" ]; then
        mkdir "macos"
    fi
    
    convert "$INPUT_FILE" -resize 16x16 -filter "$FILTER" macos/Icon-16@1x.png
    convert "$INPUT_FILE" -resize 32x32 -filter "$FILTER" macos/Icon-16@2x.png

    convert "$INPUT_FILE" -resize 32x32 -filter "$FILTER" macos/Icon-32@1x.png
    convert "$INPUT_FILE" -resize 64x64 -filter "$FILTER" macos/Icon-32@2x.png

    convert "$INPUT_FILE" -resize 128x128 -filter "$FILTER" macos/Icon-128@1x.png
    convert "$INPUT_FILE" -resize 256x256 -filter "$FILTER" macos/Icon-128@2x.png

    convert "$INPUT_FILE" -resize 256x256 -filter "$FILTER" macos/Icon-256@1x.png
    convert "$INPUT_FILE" -resize 512x512 -filter "$FILTER" macos/Icon-256@2x.png

    convert "$INPUT_FILE" -resize 512x512 -filter "$FILTER" macos/Icon-512@1x.png
    convert "$INPUT_FILE" -resize 1024x1024 -filter "$FILTER" macos/Icon-512@2x.png
fi

if [ "$TARGET_IOS" = true ]
then
    if [ ! -d "ios" ]; then
        mkdir "ios"
    fi
    
    convert "$INPUT_FILE" -resize 29x29 -filter "$FILTER" ios/Icon-29@1x.png
    convert "$INPUT_FILE" -resize 58x58 -filter "$FILTER" ios/Icon-29@2x.png
    convert "$INPUT_FILE" -resize 87x87 -filter "$FILTER" ios/Icon-29@3x.png

    convert "$INPUT_FILE" -resize 40x40 -filter "$FILTER" ios/Icon-40@1x.png
    convert "$INPUT_FILE" -resize 80x80 -filter "$FILTER" ios/Icon-40@2x.png
    convert "$INPUT_FILE" -resize 120x120 -filter "$FILTER" ios/Icon-40@3x.png

    convert "$INPUT_FILE" -resize 50x50 -filter "$FILTER" ios/Icon-50@1x.png
    convert "$INPUT_FILE" -resize 100x100 -filter "$FILTER" ios/Icon-50@2x.png

    convert "$INPUT_FILE" -resize 57x57 -filter "$FILTER" ios/Icon-57@1x.png
    convert "$INPUT_FILE" -resize 114x114 -filter "$FILTER" ios/Icon-57@2x.png

    convert "$INPUT_FILE" -resize 120x120 -filter "$FILTER" ios/Icon-60@2x.png
    convert "$INPUT_FILE" -resize 180x180 -filter "$FILTER" ios/Icon-60@3x.png

    convert "$INPUT_FILE" -resize 72x72 -filter "$FILTER" ios/Icon-72.png
    convert "$INPUT_FILE" -resize 144x144 -filter "$FILTER" ios/Icon-72@2x.png

    convert "$INPUT_FILE" -resize 76x76 -filter "$FILTER" ios/Icon-76@1x.png
    convert "$INPUT_FILE" -resize 152x152 -filter "$FILTER" ios/Icon-76@2x.png

    convert "$INPUT_FILE" -resize 167x167 -filter "$FILTER" ios/Icon-83.5@2x.png

    convert "$INPUT_FILE" -resize 1024x1024 -filter "$FILTER" ios/Icon-1024@1x.png
fi

if [ "$TARGET_ANDROID" = true ]
then
    if [ ! -d "android" ]; then
        mkdir "android"
    fi
    
    convert "$INPUT_FILE" -resize 16x16 -filter "$FILTER" android/icon-16.png
    convert "$INPUT_FILE" -resize 24x24 -filter "$FILTER" android/icon-24.png
    convert "$INPUT_FILE" -resize 32x32 -filter "$FILTER" android/icon-32.png
    convert "$INPUT_FILE" -resize 48x48 -filter "$FILTER" android/icon-48.png
    convert "$INPUT_FILE" -resize 64x64 -filter "$FILTER" android/icon-64.png
    
    convert "$INPUT_FILE" -resize 36x36 -filter "$FILTER" android/icon-36.png
    
    convert "$INPUT_FILE" -resize 72x72 -filter "$FILTER" android/icon-72.png
    convert "$INPUT_FILE" -resize 96x96 -filter "$FILTER" android/icon-96.png
    
    convert "$INPUT_FILE" -resize 48x48 -filter "$FILTER" android/icon-48.png
    convert "$INPUT_FILE" -resize 72x72 -filter "$FILTER" android/icon-72.png
    convert "$INPUT_FILE" -resize 96x96 -filter "$FILTER" android/icon-96.png
    convert "$INPUT_FILE" -resize 144x144 -filter "$FILTER" android/icon-144.png
    convert "$INPUT_FILE" -resize 192x192 -filter "$FILTER" android/icon-192.png
    convert "$INPUT_FILE" -resize 512x512 -filter "$FILTER" android/icon-512.png
fi

if [ "$TARGET_WINDOWS" = true ]
then
    if [ ! -d "windows" ]; then
        mkdir "windows"
    fi
    
    convert "$INPUT_FILE" -resize 16x16 -filter "$FILTER" windows/icon-16.png
    convert "$INPUT_FILE" -resize 32x32 -filter "$FILTER" windows/icon-32.png
    convert "$INPUT_FILE" -resize 64x64 -filter "$FILTER" windows/icon-64.png
    convert "$INPUT_FILE" -resize 128x128 -filter "$FILTER" windows/icon-128.png
    convert "$INPUT_FILE" -resize 256x256 -filter "$FILTER" windows/icon-256.png
    convert windows/icon-16.png windows/icon-32.png windows/icon-64.png windows/icon-128.png windows/icon-256.png windows/icon.ico
fi
