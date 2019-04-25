module Jekyll
  module ExifData
    require 'exifr'
    require 'exifr/jpeg'
    module ExifDataFilter

      # Read exif using exifr
      def exif(input, exiftag)
        exif = EXIFR::JPEG::new(input)
        if(exiftag == "gps?")
          return (exif.send('gps') != nil)
        end
        answer = exiftag.split('.').inject(exif){|exif,tag| exif.send(tag)}
        if(answer == nil)
          return ""
        else
          return answer
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExifData::ExifDataFilter)