#import "FLTFirebaseAnalyticsPlugin.h"

@implementation FLTFirebaseAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/firebase_analytics"
            binaryMessenger:[registrar messenger]];
  FLTFirebaseAnalyticsPlugin* instance = [[FLTFirebaseAnalyticsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  // This is a stub implementation that just returns success for all method calls
  result(nil);
}

@end 