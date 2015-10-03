#!/bin/bash -l
PROJECT_NAME="SketchToXcodeDemo"
SKETCH_FILE="yourSketchFile.sketch"

PROJECT_DIR=`pwd`
IMAGES_ASSETS_DIR="$PROJECT_DIR"/"$PROJECT_NAME"/"Images.xcassets"
ICONS_DIR="PROJECT_DIR"/"Icons"

function exportAppIcon()
{
    # import artboard "AppIcon" as images.appiconset
    sketchtool export artboards "$SKETCH_FILE" \
        --output="$IMAGES_ASSETS_DIR"/AppIcon.appiconset \
        --formats="png" \
        --item="AppIcon"

  cd "$IMAGES_ASSETS_DIR"/AppIcon.appiconset

  APP_ICON="AppIcon.png"
  # iphone
  cp -p "$APP_ICON" "29.png"
  sips -Z 29 "29.png"

  cp -p "$APP_ICON" "29@2x.png"
  sips -Z 58 "29@2x.png"

  cp -p "$APP_ICON" "29@3x.png"
  sips -Z 87 "29@3x.png"

  cp -p "$APP_ICON" "40@2x.png"
  sips -Z 80 "40@2x.png"

  cp -p "$APP_ICON" "40@3x.png"
  sips -Z 120 "40@3x.png"

  cp -p "$APP_ICON" "57.png"
  sips -Z 57 "57.png"

  cp -p "$APP_ICON" "57@2x.png"
  sips -Z 114 "57@2x.png"

  cp -p "$APP_ICON" "60@2x.png"
  sips -Z 120 "60@2x.png"

  cp -p "$APP_ICON" "60@3x.png"
  sips -Z 180 "60@3x.png"

  # iPad
  cp -p "$APP_ICON" "pad29.png"
  sips -Z 29 "pad29.png"

  cp -p "$APP_ICON" "pad29@2x.png"
  sips -Z 58 "pad29@2x.png"

  cp -p "$APP_ICON" "pad40.png"
  sips -Z 40 "pad40.png"

  cp -p "$APP_ICON" "pad40@2x.png"
  sips -Z 80 "pad40@2x.png"

  cp -p "$APP_ICON" "pad50.png"
  sips -Z 50 "pad50.png"

  cp -p "$APP_ICON" "pad50@2x.png"
  sips -Z 100 "pad50@2x.png"

  cp -p "$APP_ICON" "pad72.png"
  sips -Z 72 "pad72.png"

  cp -p "$APP_ICON" "pad72@2x.png"
  sips -Z 144 "pad72@2x.png"

  cp -p "$APP_ICON" "pad76.png"
  sips -Z 76 "pad76.png"

  cp -p "$APP_ICON" "pad76@2x.png"
  sips -Z 152 "pad76@2x.png"

cat << EOF > Contents.json
{
  "images" : [
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "29.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "29@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "40@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "57.png",
      "scale" : "1x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "57@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "60@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "60@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "pad29.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "pad29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "pad40.png",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "pad40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "pad50.png",
      "scale" : "1x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "pad50@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "pad72.png",
      "scale" : "1x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "pad72@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "pad76.png",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "pad76@2x.png",
      "scale" : "2x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF
  rm "$APP_ICON"
  cd $PROJECT_DIR
}

function exportIcons()
{
    echo `pwd`
    # export icon as pdf vector
    sketchtool export slices "$SKETCH_FILE" \
        --output="$ICONS_DIR" \
        --formats="pdf" \
        --scales="0.5"

    # create assets to XCode
    cd $ICONS_DIR

    for file in *.pdf
        do

        fname=${file%%@*}
        
        # create imageset file
        assets_name="$fname".imageset
        icon_assets_dir="$IMAGES_ASSETS_DIR"/"$assets_name"
        createJSONwithAssetsName "$file"
        
        # copy imageset file to XCode
        mkdir -p "$icon_assets_dir"
        /bin/cp "$file" "$icon_assets_dir"/"$file"
        /bin/cp Contents.json "$icon_assets_dir"/Contents.json
    done

    cd $PROJECT_DIR

    # remove unused files
    rm -rf "$ICONS_DIR"
}

function createJSONwithAssetsName() 
{
cat << EOF > Contents.json
{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "$1"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF
}

# sketch flow
exportAppIcon
