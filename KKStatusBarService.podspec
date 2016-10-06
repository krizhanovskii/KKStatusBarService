#
# Be sure to run `pod lib lint KKStatusBarService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KKStatusBarService'
  s.version          = '0.1.0'
  s.summary          = 'Simple view for check internet weather or say something for user '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "iOS lib that helps provide information to user about internet connection or other thing. Simple, animatable and powerfull"

  s.homepage         = "https://github.com/krizhanovskii"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "k.krizhanovskii" => "k.krizhanovskii@gmail.com" }
  s.source           = { :git => "https://github.com/krizhanovskii/KKStatusBarService.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/_int3rn_'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'KKStatusBarService/Classes/**/*'
  s.resources = 'KKStatusBarService/Assets/Assets.xcassets'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
