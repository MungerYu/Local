#
#  Be sure to run `pod spec lint MgLocal.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MgLocal"
  s.version      = "1.0.0"
  s.summary      = "MgLocal for locals."
  s.description  = <<-DESC
                   MgLocal is use for load Ads. more helpful for admob, bu and so on
                   DESC

  s.homepage     = "http://github/MgLocal"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "MungerYu" => "linming348@126.com" }
  s.source       = { :git => "http://github/MgLocal.git", :tag => "#{s.version}" }

  s.requires_arc = true

  s.swift_version = ['4.2', '5.0']
  # s.default_subspec = 'Core'
  s.static_framework = true
  s.source_files  = "Sources/**/**/*.swift"
  
  
end
