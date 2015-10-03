#!/bin/bash -l
PROJECT_NAME="SketchToXcodeDemo"
SKETCH_FILE="yourSketchFile.sketch"

PROJECT_DIR=`pwd`
IMAGES_ASSETS_DIR="$PROJECT_DIR"/"$PROJECT_NAME"/"Images.xcassets"
ICONS_DIR="$PROJECT_DIR"/"Icons"

function exportIcons()
{
    echo `pwd`
    # export icon as pdf vector
    sketchtool export slices "$SKETCH_FILE" --output="$ICONS_DIR" --formats="png" --scales="0.5"
    sketchtool export slices "$SKETCH_FILE" --output="$ICONS_DIR" --formats="png" --scales="1"
    sketchtool export slices "$SKETCH_FILE" --output="$ICONS_DIR" --formats="png" --scales="1.5"

    # create temp directory to export assets
    if [ ! -d "$DIRECTORY" ]; then
      mkdir "$ICONS_DIR"
    fi

    # create assets to XCode
    cd "$ICONS_DIR"

    for file in *.png
        do
        
        if [[ $file == *"@"* ]]
        then
          fname=${file%%@*}
        else
          fname=${file%%.*}
        fi
        echo "$fname";

        
        # create imageset file
        assets_name="$fname".imageset
        icon_assets_dir="$IMAGES_ASSETS_DIR"/"$assets_name"
        
        
        # copy imageset file to XCode
        mkdir -p "$icon_assets_dir"
        /bin/cp "$file" "$icon_assets_dir"/"$file"
        
        createContentJsonWithPNGAssets "$fname"
        /bin/cp Contents.json "$icon_assets_dir"/Contents.json
    done

    cd "$PROJECT_DIR"

    # remove unused files
    rm -rf "$ICONS_DIR"
}

function createContentJsonWithPNGAssets()
{
cat << EOF > Contents.json
{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "$1@0.5x.png",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "filename" : "$1.png",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "filename" : "$1@1x.png",
      "scale" : "3x"
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
exportIcons
