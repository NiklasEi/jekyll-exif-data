# Jekyll-exif-data

This Jekyll plugin adds the Liquid filter `exif` using the gem [exifr](https://github.com/remvee/exifr).


## Usage
```
{{ image_path | exif: 'model'}}
{{ "assets/images/example.jpg" | exif: 'model'}}
```