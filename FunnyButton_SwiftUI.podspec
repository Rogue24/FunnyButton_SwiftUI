#
# Be sure to run `pod lib lint FunnyButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FunnyButton_SwiftUI'
  s.version          = '0.1.1'
  s.summary          = 'Convenient debugging button for SwiftUI.'

  s.description      = <<-DESC
  Convenient debugging button for SwiftUI.
                       DESC

  s.homepage         = 'https://github.com/Rogue24/FunnyButton_SwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rogue24' => 'zhoujianping24@hotmail.com' }
  s.source           = { :git => 'https://github.com/Rogue24/FunnyButton_SwiftUI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.source_files = 'FunnyButton_SwiftUI/*'
  s.swift_version = '5.5'
end
