#import "FLTFirebaseAuthPlugin.h"

@implementation FLTFirebaseAuthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/firebase_auth"
            binaryMessenger:[registrar messenger]];
  FLTFirebaseAuthPlugin* instance = [[FLTFirebaseAuthPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  // This is a stub implementation that just returns success for all method calls
  result(nil);
}

@end 