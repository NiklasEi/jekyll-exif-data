# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/exif-data/version'

Gem::Specification.new do |spec|
  spec.name        = "jekyll-exif-data"
  spec.version     = Jekyll::ExifData::VERSION
  spec.author      = "Niklas Eicker"
  spec.email       = ["hello@nikl.me"]
  spec.licenses    = ['MIT']
  spec.homepage    = "https://github.com/NiklasEi/jekyll-exif-data"
  spec.summary     = "This plugin provides exif data for images in Jekyll websites via a Liquid filter using exifr. For source code, issues, and example usages please refer to the GitHub repository."
  spec.description = "Provides exif data for images in Jekyll websites via a Liquid filter"

  spec.files         = [*Dir["lib/**/*.rb"], "README.md", "LICENSE.md"]
  spec.test_files    = [*Dir["spec/*.rb"]]
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata = {
        'bug_tracker_uri'   => 'https://github.com/NiklasEi/jekyll-exif-data/issues',
        'documentation_uri' => 'https://github.com/NiklasEi/jekyll-exif-data',
        'homepage_uri'      => 'https://github.com/NiklasEi/jekyll-exif-data',
        'source_code_uri'   => 'https://github.com/NiklasEi/jekyll-exif-data',
        'changelog_uri'     => 'https://github.com/NiklasEi/jekyll-exif-data/blob/master/changelog.md'
    }
  end

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency 'liquid'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.6"

  spec.add_dependency "exifr", "~> 1.3"
end
