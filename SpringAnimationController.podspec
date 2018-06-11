#
# Be sure to run `pod lib lint SpringAnimationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SpringAnimationController'
  s.version          = '1.0.0'
  s.summary          = 'A custom modal UIViewController presentation that mimics a spring.'

  s.description      = 'SpringAnimationController provides a suble way to spice up the default modal presentantion style on iOS. Simply set the UIViewControllerTransitioningDelegate and return this animation controller to add some bounce at the top of your modal presentation.'

  s.homepage         = 'https://github.com/pietrorea/SpringAnimationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pietrorea' => 'pietro@sweetpeamobile.com' }
  s.social_media_url = 'https://twitter.com/pietrorea'
  s.source           = { :git => 'https://github.com/pietrorea/SpringAnimationController.git', :branch => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '4.1'

  s.source_files = 'SpringAnimationController/Classes/*.swift'

end
