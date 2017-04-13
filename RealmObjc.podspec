#
# Be sure to run `pod lib lint RealmObjc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RealmObjc'
  s.version          = '0.1.1'
  s.summary          = 'RealmObjc which help you to query faster in Realm.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
RealmObjc which help you to query faster in Realm... bla bla
                       DESC

  s.homepage         = 'https://github.com/Cu-Toof/RealmObjc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'toanf9dn@gmail.com' => 'toanf9dn@gmail.com' }
  s.source           = { :git => 'https://github.com/Cu-Toof/RealmObjc.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RealmObjc/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RealmObjc' => ['RealmObjc/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.swift'
  s.frameworks = 'Foundation'
  s.dependency 'RealmSwift', '~> 2.2'
  s.dependency 'ObjectMapper', '~> 2.2'

end
