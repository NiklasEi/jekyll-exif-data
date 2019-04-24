# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/exif-data/version'

Gem::Specification.new do |spec|
  spec.name        = "jekyll-exif-data"
  spec.version     = Jekyll::ExifData::VERSION
  spec.authors     = ["Niklas Eicker"]
  spec.email       = ["hello@nikl.me"]
  spec.homepage    = "http://rubygems.org/gems/foodie"
  spec.summary     = "jekyll-exif-data makes exif data accessible for jekyll sites"
  spec.description = "jekyll-exif-data adds the Liquid filter exif which uses exirf to read the exif data of an image"

  spec.files         = [*Dir["lib/**/*.rb"], "README.md", "LICENSE.md"]
  spec.test_files    = [*Dir["spec/*.rb"]]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency 'liquid'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.6"

  spec.add_dependency "exifr", "~> 1.3"
end