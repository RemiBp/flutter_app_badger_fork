#import "FlutterWebRTCPlugin.h"

@implementation FlutterWebRTCPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"FlutterWebRTC"
            binaryMessenger:[registrar messenger]];
  FlutterWebRTCPlugin* instance = [[FlutterWebRTCPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  // This is a stub implementation
  result(nil);
}

@end 