# Jekyll-exif-data

[![Gem Version](https://badge.fury.io/rb/jekyll-exif-data.svg)](https://badge.fury.io/rb/jekyll-exif-data)

This Jekyll plugin adds the Liquid filter `exif`, supplying exif data to Jekyll websites. To read the data [exifr](https://github.com/remvee/exifr) is needed as a dependency.

## Installation

Add the plugin to your site's Gemfile:
```
group :jekyll_plugins do
  # your other jekyll plugins...
  gem 'jekyll-exif-data', '~> 0.0'
end
```
Then run ```$ bundler install```. The dependency of the plugin is also automatically installed by this command.

<br><br>

Or install it:
```
$ gem install jekyll-exif-data
```

## Usage

The `exif` filter takes the exif tag as the argument and acts on the path to the image (no leading slash).

Examples:
```
{% assign image_path = "assets/my_image.jpg" %}
{{ image_path | exif: 'model'}}
{{ "assets/images/example.jpg" | exif: 'model'}}
```

For more examples of possible exif tags see [exifr](https://github.com/remvee/exifr). The argument taken by the `exif` filter is the name of the method in exifr (for deeper methods join them with a dot e.g. `gps.latitude` or `f_number.to_f`).

You can use the arguments `exif?` and `gps?` to figure out whether there is any exif/gps data for your image. Example code to link to the location where the image was taken on https://www.openstreetmap.org:
```
{% capture has_exif %}{{ image-path-no-leading-slash | exif: "exif?" }}{% endcapture %}
{% capture has_gps %}{{ image-path-no-leading-slash | exif: "gps?" }}{% endcapture %}
{% if has_exif %}
    Taken
    {% if has_gps=="true" %}
        <a href="https://www.openstreetmap.org/?mlat={{ image-path-no-leading-slash | exif: 'gps.latitude' }}&mlon={{ image-path-no-leading-slash | exif: 'gps.longitude' }}&zoom=8&layers=M" target="_blank">here </a>
    {% endif %}
    with a {{ image-path-no-leading-slash | exif: 'model' }}.
{% endif %}
```

If the exif tag exists, but there is no value saved for it "nil" is returned (as String!).