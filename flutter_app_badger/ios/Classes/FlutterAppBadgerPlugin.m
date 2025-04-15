#import "FlutterAppBadgerPlugin.h"

@implementation FlutterAppBadgerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_app_badger"
            binaryMessenger:[registrar messenger]];
  FlutterAppBadgerPlugin* instance = [[FlutterAppBadgerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"updateBadgeCount" isEqualToString:call.method]) {
    NSNumber* count = call.arguments[@"count"];
    [UIApplication sharedApplication].applicationIconBadgeNumber = [count intValue];
    result(nil);
  } else if ([@"removeBadge" isEqualToString:call.method]) {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end 