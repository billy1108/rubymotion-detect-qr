# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Detect QR'

  app.frameworks += %w(UIKit AVFoundation)

  app.pods do
    pod 'QRCodeReaderViewController', '~> 2.0.0'
  end
  
end