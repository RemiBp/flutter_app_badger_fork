#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'contacts_service'
  s.version          = '1.0.0'
  s.summary          = 'A plugin for accessing contacts on iOS and Android'
  s.description      = <<-DESC
A Flutter plugin to access and manage contacts on iOS and Android devices.
                       DESC
  s.homepage         = 'https://github.com/RemiBp/Choice.git'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Rémi Barbier' => 'remi.barbier@hec.edu' }
  s.source           = { :git => 'https://github.com/RemiBp/Choice.git', :tag => s.version.to_s }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end 