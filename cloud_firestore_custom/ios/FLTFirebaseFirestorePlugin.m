#import "FLTFirebaseFirestorePlugin.h"

@implementation FLTFirebaseFirestorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/firebase_firestore"
            binaryMessenger:[registrar messenger]];
  FLTFirebaseFirestorePlugin* instance = [[FLTFirebaseFirestorePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  // Basic stub implementation - returns empty/null results for all calls
  if ([@"Query#get" isEqualToString:call.method]) {
    NSDictionary* data = @{
      @"documents": @{},
    };
    result(data);
  } else if ([@"DocumentReference#get" isEqualToString:call.method]) {
    NSDictionary* data = @{
      @"data": @{},
      @"path": @"stub/path",
      @"exists": @YES,
    };
    result(data);
  } else {
    // Default - just return nil/null for most operations
    result(nil);
  }
}

@end 