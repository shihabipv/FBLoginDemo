# Be sure to run `pod lib lint FBLoginDemo.podspec.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  
  s.platform = :ios
  s.ios.deployment_target = '9.1'
  
  s.name             = 'FBLoginDemo'
  s.version          = '1.0.0'
  s.summary          = 'FBLoginDemo is a sample project for Logging into an App using Twitter account.'
  s.author           = { 'Shihabul Islam' => 'shihabul@ipvisionsoft.com' }
  
  s.source           = { :git => 'https://github.com/shihabipv/FBLoginDemo.git', :tag => "#{s.version}"}

  s.homepage         = 'https://github.com/shihabipv/FBLoginDemo'

  s.license = { :type => "MIT", :file => "LICENSE" }
  
  s.framework = "UIKit"
  
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKShareKit'
  s.dependency 'FBSDKLoginKit'

  s.source_files  = "FBLoginDemo/**/*.{h,m}"

  s.resource = "FBLoginDemo/**/*.{storyboard}"

end