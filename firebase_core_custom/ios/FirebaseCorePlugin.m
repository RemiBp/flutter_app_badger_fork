#import "FirebaseCorePlugin.h"

@implementation FirebaseCorePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/firebase_core"
            binaryMessenger:[registrar messenger]];
  FirebaseCorePlugin* instance = [[FirebaseCorePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"Firebase#initializeApp" isEqualToString:call.method]) {
    [self initializeApp:call result:result];
  } else if ([@"Firebase#apps" isEqualToString:call.method]) {
    [self getApps:result];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)initializeApp:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSString* appName = call.arguments[@"appName"];
  NSDictionary* options = call.arguments[@"options"];
  
  if (!appName) {
    appName = @"DEFAULT";
  }
  
  NSMutableDictionary* appMap = [NSMutableDictionary dictionary];
  [appMap setValue:appName forKey:@"name"];
  
  if (options) {
    [appMap setValue:options forKey:@"options"];
  } else {
    NSMutableDictionary* defaultOptions = [NSMutableDictionary dictionary];
    [defaultOptions setValue:@"stub-api-key" forKey:@"apiKey"];
    [defaultOptions setValue:@"stub-app-id" forKey:@"appId"];
    [defaultOptions setValue:@"stub-sender-id" forKey:@"messagingSenderId"];
    [defaultOptions setValue:@"stub-project-id" forKey:@"projectId"];
    [appMap setValue:defaultOptions forKey:@"options"];
  }
  
  result(appMap);
}

- (void)getApps:(FlutterResult)result {
  // Return a stub apps list with a default app
  NSMutableArray* apps = [NSMutableArray array];
  
  NSMutableDictionary* defaultApp = [NSMutableDictionary dictionary];
  [defaultApp setValue:@"DEFAULT" forKey:@"name"];
  
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  [options setValue:@"stub-api-key" forKey:@"apiKey"];
  [options setValue:@"stub-app-id" forKey:@"appId"];
  [options setValue:@"stub-sender-id" forKey:@"messagingSenderId"];
  [options setValue:@"stub-project-id" forKey:@"projectId"];
  
  [defaultApp setValue:options forKey:@"options"];
  [apps addObject:defaultApp];
  
  result(apps);
}

@end 