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
  app.version = '1.0'
  app.short_version = '1.0'
  app.device_family = :iphone
  app.deployment_target = "8.0"
  app.interface_orientations = [:portrait]
  app.archs['iPhoneOS'] |= ['arm64']

  app.frameworks += %w(UIKit AVFoundation)


  # YogaBuddy Credentials

  app.identifier = 'com.yogabuddy.yogabuddy'
  app.seed_id = 'C6T9Q795B6'
  app_id = "#{app.seed_id}.#{app.identifier}"
  app.entitlements['application-identifier'] = app_id
  app.entitlements['keychain-access-groups'] = [app_id]
  


  # Development:
    app.development do
      app.provisioning_profile = "/Users/rubymotion/Desktop/YogaBuddy_Cert/yogabuddy_development.mobileprovision"
      app.codesign_certificate = "iPhone Developer: Martin  Lopez (59B262L5C3)"
      app.entitlements['aps-environment'] = 'development'
      app.entitlements['get-task-allow'] = true
    end

    # Ad-Hoc or Distribution:
    app.release do
      # app.provisioning_profile = "/Users/rubymotion/Desktop/YogaBuddy_Cert/YogaBuddy_AdHoc.mobileprovision" # Ad-Hoc
      app.provisioning_profile = "/Users/rubymotion/Desktop/YogaBuddy_Cert/YogaBuddy_App_Store.mobileprovision" # Distribution
      app.codesign_certificate = "iPhone Distribution: YOGABUDDY LLC  (C6T9Q795B6)"
      app.entitlements['aps-environment'] = 'production'
      app.entitlements['get-task-allow'] = false
    end
end
