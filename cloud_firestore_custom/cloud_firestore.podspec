require 'yaml'
pubspec = YAML.load_file(File.join('..', 'pubspec.yaml'))
Pod::Spec.new do |s|
  s.name             = 'cloud_firestore'
  s.version          = '0.0.1' # You can use the version from pubspec
  s.summary          = 'Flutter Cloud Firestore'
  s.description      = 'Flutter plugin for Cloud Firestore, a cloud-hosted, noSQL database with live synchronization and offline support on Android and iOS.'
  s.homepage         = 'https://github.com/firebase/flutterfire/tree/master/packages/cloud_firestore'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Flutter Team' => 'flutter-dev@googlegroups.com' }
  s.source           = { :path => '.' }
  s.source_files = 'ios/**/*.{h,m}'
  s.public_header_files = 'ios/**/*.h'
  s.ios.deployment_target = '10.0'
  s.dependency 'Flutter'
  s.dependency 'firebase_core'
  s.dependency 'Firebase/Firestore', '~> 10.12.0'
  s.static_framework = true
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => "LIBRARY_VERSION=\\@\\\"#{pubspec['version']}\\\" LIBRARY_NAME=\\@\\\"flutter-fire-fst\\\"" }
end 