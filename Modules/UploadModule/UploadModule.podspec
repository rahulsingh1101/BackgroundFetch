#
#  Be sure to run `pod spec lint UploadModule.podspec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = 'UploadModule'
  s.version          = '1.0.0'
  s.summary          = 'A module for uploading videos.'
  s.description      = 'This module provides functionality for uploading videos within an iOS app.'

  s.homepage         = 'https://example.com/upload-module'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "rahulsingh1101" => "rkssingh566@gmail.com" }

  s.platform     = :ios, '10.0'
  s.source       = { :git => 'https://github.com/yourusername/UploadModule.git', :tag => s.version.to_s }

  s.source_files = 'Source/*.swift'

end
