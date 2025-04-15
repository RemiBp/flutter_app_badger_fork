#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_local_notifications'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for displaying local notifications.'
  s.description      = <<-DESC
A Flutter plugin for local notifications.
                       DESC
  s.homepage         = 'https://github.com/MaikuB/flutter_local_notifications'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Michael Bui' => 'example@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end 