# SketchToXcode

![SketchToXcode.png](https://raw.githubusercontent.com/gliyao/SketchToXcode/master/SketchToXcode.png)

You don't need to manage assets manually. This script help you export all the assets you need from your Sketch file.

## Requirement
1. Sketch app
2. sketchtool - cli tool for Sketch (http://bohemiancoding.com/sketch/tool/)

## Sketch file setup
1. An artboard "AppIcon" and its size is 1024x1024
2. Slices for your icons. (Slice name as assets name, and it must design by 2x pixel)

## Steps
1. Put {script}.sh and your Sketch file to project root.
2. Adjust paramaters you need 
	1. PROJECT_NAME
	2. SKETCH_FILE
3. Open terminal at your project root
4. Run {script}.sh

## 3 scripts for 3 purpose
1. do_sketch_app_icon.sh
2. do_sketch_pdf_slices.sh
3. do_sketch_png_slices.sh

## Related link
Also provide XCode plugin version.
SketchExporter - https://github.com/gliyao/SketchExporter