import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

/// FirebaseAnalytics Custom Implementation
/// 
/// This is a simplified version of the Firebase Analytics plugin that avoids
/// Android Gradle build issues by providing a minimal implementation.
class FirebaseAnalytics {
  static FirebaseAnalytics? _instance;
  
  final MethodChannel _channel = const MethodChannel('plugins.flutter.io/firebase_analytics');
  
  FirebaseApp? _app;
  
  /// Returns the singleton instance of the Firebase Analytics plugin.
  static FirebaseAnalytics get instance => _instance ??= FirebaseAnalytics._();
  
  FirebaseAnalytics._();
  
  /// Factory for creating a [FirebaseAnalytics] for a specific Firebase app.
  factory FirebaseAnalytics.instanceFor({required FirebaseApp app}) {
    if (kIsWeb || app.name == defaultFirebaseAppName) {
      return FirebaseAnalytics.instance;
    }
    
    return FirebaseAnalytics._withApp(app);
  }
  
  FirebaseAnalytics._withApp(FirebaseApp app) {
    _app = app;
  }
  
  /// Logs an app event with the given [name] and [parameters].
  Future<void> logEvent({required String name, Map<String, Object?>? parameters}) async {
    try {
      await _channel.invokeMethod<void>('logEvent', <String, dynamic>{
        'name': name,
        'parameters': parameters ?? <String, dynamic>{},
      }).catchError((_) {
        // Ignore errors - this is a stub implementation
      });
    } catch (e) {
      debugPrint('FirebaseAnalytics: Error logging event: $e');
    }
    
    return;
  }
  
  /// Sets the user ID for the current user.
  Future<void> setUserId({String? id}) async {
    return;
  }
  
  /// Sets a user property to the given value.
  Future<void> setUserProperty({required String name, required String? value}) async {
    return;
  }
  
  /// Logs the current screen.
  Future<void> setCurrentScreen({required String? screenName, String screenClassOverride = 'Flutter'}) async {
    return;
  }
  
  /// Enables or disables analytics collection for this app on this device.
  Future<void> setAnalyticsCollectionEnabled(bool enabled) async {
    return;
  }
  
  /// Clears all analytics data for this app from the device and resets the app instance ID.
  Future<void> resetAnalyticsData() async {
    return;
  }
  
  // Add any other methods you need here...
}

/// Observer class for tracking route changes in the Navigator.
class FirebaseAnalyticsObserver {
  final FirebaseAnalytics analytics;
  final RouteFilter? routeFilter;
  final ScreenNameExtractor nameExtractor;
  
  /// Creates a [FirebaseAnalyticsObserver].
  FirebaseAnalyticsObserver({
    FirebaseAnalytics? analytics,
    this.routeFilter,
    ScreenNameExtractor? nameExtractor,
  }) : 
    analytics = analytics ?? FirebaseAnalytics.instance,
    nameExtractor = nameExtractor ?? defaultNameExtractor;
  
  // No-op implementation of navigator observer methods
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {}
}

/// Signature for a function that extracts a screen name from a route.
typedef ScreenNameExtractor = String? Function(RouteSettings settings);

/// Signature for a function that takes a route and returns a boolean value.
typedef RouteFilter = bool Function(Route<dynamic> route);

/// The default function for extracting the screen name from route settings.
String? defaultNameExtractor(RouteSettings settings) => settings.name;

// Define a constant for default Firebase app name
const String defaultFirebaseAppName = 'DEFAULT'; 