#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'emoji_picker_flutter'
  s.version          = '1.6.4'
  s.summary          = 'A Flutter plugin that provides an emoji picker.'
  s.description      = <<-DESC
A customized version of emoji_picker_flutter with compatibility fixes.
                       DESC
  s.homepage         = 'https://github.com/RemiBp/flutter_app_badger_fork'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'RemiBp' => 'your-email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end 