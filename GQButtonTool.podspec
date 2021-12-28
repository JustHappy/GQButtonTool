#
# Be sure to run `pod lib lint GQButtonTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GQButtonTool'
  s.version          = '0.1.0'
  s.summary          = '基于UIButton的工具类。包含设置按钮连点及按钮文字图片位置'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 基于UIButton的工具类。包含设置按钮连点及按钮文字图片位置，设置按钮的点击间隔时间.
                       DESC

  s.homepage         = 'https://github.com/JustHappy/GQButtonTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JustHappy' => '1157485147@qq.com' }
  s.source           = { :git => 'https://github.com/JustHappy/GQButtonTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'GQButtonTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GQButtonTool' => ['GQButtonTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
