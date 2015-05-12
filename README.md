# SketchToXcode

Your don't need manage assets manually. This script help you export all assets you need from your sktch file.

## Requirement
1. Sketch app
2. sketchtool - cli tool for sketch (http://bohemiancoding.com/sketch/tool/)

## Sketch file setup
1. An artboard "AppIcon" and its size is 1024x1024
2. Slices for your icons. (Slice name as assets name)

## Steps
1. Put do_sketch.sh and your sketch file to project root.
2. Adjust paramaters you need 
	1. PROJECT_NAME
	2. SKETCH_FILE
3. Open terminal at your project root
4. Run do_sketch.sh
