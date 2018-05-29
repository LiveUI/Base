#
# Be sure to run `pod lib lint Presentables.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'LiveUIBase'
    s.version          = '0.0.1'
    s.summary          = 'Llalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalal'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = "Llalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalalLlalalala lalala lalalalal"

    s.homepage         = 'https://github.com/LiveUI/LiveUIBase'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ondrej Rafaj' => 'dev@liveui.io' }
    s.source           = { :git => 'https://github.com/LiveUI/LiveUIBase.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/rafiki270'

    s.ios.deployment_target = '10.0'
    s.tvos.deployment_target = '10.2'

    s.source_files = 'Classes/**/*'

    # s.resource_bundles = {
    #   'BoostSDK' => ['Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Modular', '~> 1.0.0'
    s.dependency 'SnapKit', '~> 4.0.0'
	s.dependency 'Presentables', '~> 0.6.6'
	s.dependency 'AwesomeEnum', '~> 1.2.0'
end
