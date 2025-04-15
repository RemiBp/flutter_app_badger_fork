#import "FlutterLocalNotificationsPlugin.h"
#import <UserNotifications/UserNotifications.h>

@implementation FlutterLocalNotificationsPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_local_notifications"
            binaryMessenger:[registrar messenger]];
  FlutterLocalNotificationsPlugin* instance = [[FlutterLocalNotificationsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"initialize" isEqualToString:call.method]) {
    result(@YES);
  } else if ([@"show" isEqualToString:call.method]) {
    // Basic implementation
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = call.arguments[@"title"];
    content.body = call.arguments[@"body"];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"LocalNotification" content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
      result(@(error == nil));
    }];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end 