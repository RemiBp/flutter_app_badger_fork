import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Firebase Core Custom Implementation
/// 
/// This is a simplified version of the Firebase Core plugin that avoids
/// Android Gradle build issues by providing a minimal implementation.
class FirebaseCoreCustom {
  static FirebaseCoreCustom? _instance;
  
  final MethodChannel _channel = const MethodChannel('plugins.flutter.io/firebase_core');
  
  /// Returns the singleton instance of the Firebase Core plugin.
  static FirebaseCoreCustom get instance => _instance ??= FirebaseCoreCustom._();
  
  FirebaseCoreCustom._();
  
  /// Returns a stub Firebase app instance.
  Future<FirebaseApp> initializeApp({String? name, Map<String, dynamic>? options}) async {
    try {
      // Try to call native method, but don't throw if it fails
      await _channel.invokeMethod<Map<dynamic, dynamic>>('Firebase#initializeApp', {
        'appName': name ?? 'DEFAULT',
        'options': options ?? {},
      }).catchError((_) {
        // Ignore errors - this is a stub implementation
      });
    } catch (e) {
      debugPrint('FirebaseCoreCustom: Error initializing Firebase app: $e');
      // Ignore errors - just return a stub app
    }
    
    // Return a stub app regardless of what happened
    return FirebaseApp(
      name: name ?? 'DEFAULT',
      options: FirebaseOptions(
        apiKey: options?['apiKey'] ?? 'stub-api-key',
        appId: options?['appId'] ?? 'stub-app-id',
        messagingSenderId: options?['messagingSenderId'] ?? 'stub-sender-id',
        projectId: options?['projectId'] ?? 'stub-project-id',
      ),
    );
  }
  
  /// Returns a list of available Firebase apps.
  Future<List<FirebaseApp>> get apps async {
    try {
      final List<Map<dynamic, dynamic>>? apps = await _channel.invokeListMethod<Map<dynamic, dynamic>>(
        'Firebase#apps',
      ).catchError((_) => null);
      
      if (apps == null) {
        return [
          FirebaseApp(
            name: 'DEFAULT',
            options: FirebaseOptions(
              apiKey: 'stub-api-key',
              appId: 'stub-app-id',
              messagingSenderId: 'stub-sender-id',
              projectId: 'stub-project-id',
            ),
          ),
        ];
      }
      
      return apps.map((app) {
        return FirebaseApp(
          name: app['name'],
          options: FirebaseOptions(
            apiKey: app['options']['apiKey'],
            appId: app['options']['appId'],
            messagingSenderId: app['options']['messagingSenderId'],
            projectId: app['options']['projectId'],
          ),
        );
      }).toList();
    } catch (e) {
      debugPrint('FirebaseCoreCustom: Error getting Firebase apps: $e');
      return [
        FirebaseApp(
          name: 'DEFAULT',
          options: FirebaseOptions(
            apiKey: 'stub-api-key',
            appId: 'stub-app-id',
            messagingSenderId: 'stub-sender-id',
            projectId: 'stub-project-id',
          ),
        ),
      ];
    }
  }
}

/// A simplified version of the FirebaseApp class.
class FirebaseApp {
  final String name;
  final FirebaseOptions options;
  
  FirebaseApp({required this.name, required this.options});
  
  @override
  String toString() => 'FirebaseApp($name)';
}

/// A simplified version of the FirebaseOptions class.
class FirebaseOptions {
  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  
  const FirebaseOptions({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
  });
  
  @override
  String toString() => 'FirebaseOptions(apiKey: $apiKey, appId: $appId)';
} 