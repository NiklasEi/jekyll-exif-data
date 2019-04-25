# Jekyll-exif-data

[![Gem Version](https://badge.fury.io/rb/jekyll-exif-data.svg)](https://badge.fury.io/rb/jekyll-exif-data)

This Jekyll plugin adds the Liquid filter `exif`, supplying exif data to Jekyll websites. To read the data [exifr](https://github.com/remvee/exifr) is used as a dependency.

## Installation

Add the plugin to your site's Gemfile:
```ruby
group :jekyll_plugins do
  # your other jekyll plugins...
  gem 'jekyll-exif-data', '~> 0.0'
end
```

Then run
```bash
$ bundle install
```
in your jekyll project directory. The dependency of the plugin is also automatically installed by this command.

### Manual installation
In your terminal:
```bash
$ gem install jekyll-exif-data
```

Then add the plugin to your `_config` file:
```yml
plugins:
  - jekyll-exif-data
```



## Usage
```Liquid
{{ image_path | exif: '[exif-tag]'}}
```

The `exif` filter takes the exif tag as the argument and acts on the image (path without leading slash).

Examples:
```Liquid
{% assign image_path = "assets/my_image.jpg" %}
{{ image_path | exif: 'model'}}
{{ "assets/images/example.jpg" | exif: 'date_time' | date: "%Y" }}
```

For more examples of possible exif tags see [exifr](https://github.com/remvee/exifr). The argument taken by the `exif` filter is the name of the method in exifr (for deeper methods join them with a dot e.g. `gps.latitude` or `f_number.to_f`).

You can use the arguments `exif?` and `gps?` to figure out whether there is any exif/gps data for your image. The code shown below links to the location on https://www.openstreetmap.org where the image was taken and additionally provides the model of the camera used and the year.
```Liquid
{% capture has_exif %}{{ image-path-no-leading-slash | exif: "exif?" }}{% endcapture %}
{% capture has_gps %}{{ image-path-no-leading-slash | exif: "gps?" }}{% endcapture %}
{% if has_exif %}
    Taken
    {% if has_gps=="true" %}
        <a href="https://www.openstreetmap.org/?mlat={{ image-path-no-leading-slash | exif: 'gps.latitude' }}&mlon={{ image-path-no-leading-slash | exif: 'gps.longitude' }}&zoom=8&layers=M" target="_blank">here </a>
    {% endif %}
    with a {{ image-path-no-leading-slash | exif: 'model' }}
    in {{ image-path-no-leading-slash | exif: 'date_time' | date: "%Y" }}.
{% endif %}
```

If the exif tag exists, but there is no value saved for it an empty String is returned opposed to `nil` by exifr.