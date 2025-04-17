import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The entry point for accessing Firebase Messaging.
///
/// This is a stub implementation to avoid Android Gradle issues.
class FirebaseMessaging {
  FirebaseMessaging._();

  static FirebaseMessaging _instance = FirebaseMessaging._();

  /// Returns an instance of [FirebaseMessaging].
  static FirebaseMessaging get instance => _instance;

  /// Returns the [FirebaseApp] for the current instance.
  FirebaseApp get app => Firebase.app();

  /// Returns an instance using a specified [FirebaseApp].
  static FirebaseMessaging instanceFor({
    required FirebaseApp app,
  }) {
    return _instance;
  }

  /// Returns the default FCM token for this device.
  Future<String?> getToken() async {
    return 'stub-token';
  }

  /// Deletes the default FCM token for this device.
  Future<void> deleteToken() async {
    return;
  }

  /// Subscribe to topic in background.
  Future<void> subscribeToTopic(String topic) async {
    return;
  }

  /// Unsubscribe from topic in background.
  Future<void> unsubscribeFromTopic(String topic) async {
    return;
  }

  /// Enable or disable auto-initialization of Firebase Cloud Messaging.
  Future<void> setAutoInitEnabled(bool enabled) async {
    return;
  }

  /// Request permission to display alerts, badges, and sounds.
  Future<NotificationSettings> requestPermission({
    bool alert = true,
    bool announcement = false,
    bool badge = true,
    bool carPlay = false,
    bool criticalAlert = false,
    bool provisional = false,
    bool sound = true,
  }) async {
    return NotificationSettings(
      authorizationStatus: AuthorizationStatus.authorized,
      alert: AppleNotificationSetting.enabled,
      announcement: AppleNotificationSetting.notSupported,
      badge: AppleNotificationSetting.enabled,
      carPlay: AppleNotificationSetting.notSupported,
      criticalAlert: AppleNotificationSetting.notSupported,
      lockScreen: AppleNotificationSetting.enabled,
      notificationCenter: AppleNotificationSetting.enabled,
      showPreviews: AppleShowPreviewSetting.always,
      sound: AppleNotificationSetting.enabled,
    );
  }

  /// Returns the current notification settings for this app.
  Future<NotificationSettings> getNotificationSettings() async {
    return NotificationSettings(
      authorizationStatus: AuthorizationStatus.authorized,
      alert: AppleNotificationSetting.enabled,
      announcement: AppleNotificationSetting.notSupported,
      badge: AppleNotificationSetting.enabled,
      carPlay: AppleNotificationSetting.notSupported,
      criticalAlert: AppleNotificationSetting.notSupported,
      lockScreen: AppleNotificationSetting.enabled,
      notificationCenter: AppleNotificationSetting.enabled,
      showPreviews: AppleShowPreviewSetting.always,
      sound: AppleNotificationSetting.enabled,
    );
  }

  /// Sets the presentation options for Apple notifications when received in the foreground.
  Future<void> setForegroundNotificationPresentationOptions({
    bool alert = false,
    bool badge = false,
    bool sound = false,
  }) async {
    return;
  }

  /// Stream of incoming messages.
  Stream<RemoteMessage> get onMessage => const Stream.empty();

  /// Stream of messages received when the application is in the background or terminated.
  Stream<RemoteMessage> get onMessageOpenedApp => const Stream.empty();

  /// Gets the initial message that launched the app.
  Future<RemoteMessage?> getInitialMessage() async {
    return null;
  }

  /// Handle a background message.
  static Future<void> onBackgroundMessage(
      Future<void> Function(RemoteMessage) handler) async {
    return;
  }
}

/// Message that wrapped up the data sent from FCM to the app.
class RemoteMessage {
  /// The unique ID of the message.
  final String? messageId;

  /// The topic name or message identifier.
  final String? messageType;

  /// Data included in the message.
  final Map<String, dynamic>? data;

  /// The notification data included in the message.
  final RemoteNotification? notification;

  /// The category to which this notification belongs.
  final String? category;

  /// The collapse key a message was sent with.
  final String? collapseKey;

  /// The time the message was sent.
  final DateTime? sentTime;

  /// The time the message was received.
  final DateTime? receivedTime;

  /// The time to live for the message in seconds.
  final int? ttl;

  /// The ID of the FCM app.
  final String? from;

  RemoteMessage({
    this.messageId,
    this.messageType,
    this.data,
    this.category,
    this.collapseKey,
    this.from,
    this.notification,
    this.sentTime,
    this.ttl,
    DateTime? receivedTime,
  }) : receivedTime = receivedTime ?? DateTime.now();
}

/// A class representing a notification message that was sent from the FCM server to your app.
class RemoteNotification {
  /// The notification title.
  final String? title;

  /// The notification body content.
  final String? body;

  /// Any Android specific notification data.
  final AndroidNotification? android;

  /// Any Apple specific notification data.
  final AppleNotification? apple;

  RemoteNotification({
    this.title,
    this.body,
    this.android,
    this.apple,
  });
}

/// Android specific notification data.
class AndroidNotification {
  /// The notification channel id.
  final String? channelId;

  /// The notification click action.
  final String? clickAction;

  /// The notification color.
  final String? color;

  /// The notification count.
  final int? count;

  /// The image URL for the notification.
  final String? imageUrl;

  /// The notification link.
  final String? link;

  /// The notification priority.
  final AndroidNotificationPriority? priority;

  /// Small icon resource name for notifications.
  final String? smallIcon;

  /// The sound resource name.
  final String? sound;

  /// Use a ticker in the status bar for this notification.
  final String? ticker;

  /// The notification tag.
  final String? tag;

  /// The visibility level of the notification.
  final AndroidNotificationVisibility? visibility;

  AndroidNotification({
    this.channelId,
    this.clickAction,
    this.color,
    this.count,
    this.imageUrl,
    this.link,
    this.priority,
    this.smallIcon,
    this.sound,
    this.ticker,
    this.tag,
    this.visibility,
  });
}

/// Represents the importance or priority of a notification on Android.
enum AndroidNotificationPriority {
  minimumPriority,
  lowPriority,
  defaultPriority,
  highPriority,
  maximumPriority,
}

/// Represents the visibility level of a notification on Android.
enum AndroidNotificationVisibility {
  /// Show this notification in its entirety on all lockscreens.
  public,

  /// Show this notification on all lockscreens, but conceal sensitive or private information on secure lockscreens.
  private,

  /// Do not reveal any part of this notification on a secure lockscreen.
  secret,
}

/// The Apple platform specific notification options.
class AppleNotification {
  /// The subtitle of the notification.
  final String? subtitle;

  /// Any sound resources to be played.
  final String? sound;

  /// The notification badge count.
  final String? badge;

  /// The action to be performed on the notification if tapped.
  final String? category;

  AppleNotification({
    this.subtitle,
    this.sound,
    this.badge,
    this.category,
  });
}

/// The notification settings for each platform.
class NotificationSettings {
  /// The authorization status for the current app.
  final AuthorizationStatus authorizationStatus;

  /// The notification settings for apple devices.
  final AppleNotificationSetting? alert;
  final AppleNotificationSetting? announcement;
  final AppleNotificationSetting? badge;
  final AppleNotificationSetting? carPlay;
  final AppleNotificationSetting? criticalAlert;
  final AppleNotificationSetting? lockScreen;
  final AppleNotificationSetting? notificationCenter;
  final AppleShowPreviewSetting? showPreviews;
  final AppleNotificationSetting? sound;

  NotificationSettings({
    required this.authorizationStatus,
    this.alert,
    this.announcement,
    this.badge,
    this.carPlay,
    this.criticalAlert,
    this.lockScreen,
    this.notificationCenter,
    this.showPreviews,
    this.sound,
  });
}

/// The status of a registration authorization request.
enum AuthorizationStatus {
  /// Status of authorization is not determined.
  notDetermined,

  /// This app is not authorized to request notification.
  denied,

  /// This app is authorized to request notification.
  authorized,

  /// This app is provisionally authorized to post notification.
  provisional,
}

/// A type of notification setting for Apple platforms.
enum AppleNotificationSetting {
  /// You are not allowed to read the notification setting.
  notSupported,

  /// Setting is disabled.
  disabled,

  /// Setting is enabled.
  enabled,
}

/// An enum representing the presentation options for Apple notifications.
enum AppleShowPreviewSetting {
  /// Apple Setting: "Never" (Show preview only when unlocked)
  never,

  /// Apple Setting: "When Unlocked" (Show preview only when unlocked)
  whenAuthenticated,

  /// Apple Setting: "Always" (Always show preview)
  always,
} 