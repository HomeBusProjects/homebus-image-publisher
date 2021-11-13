#!/usr/bin/env ruby

require './options'
require './app'

image_publisher_app_options = ImagePublisherHomebusAppOptions.new

image_publisher = ImagePublisherHomebusApp.new image_publisher_app_options.options
image_publisher.run!
