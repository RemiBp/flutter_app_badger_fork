// Cette bibliothèque exporte tout le contenu de firebase_core_custom.dart
// pour rendre l'API compatible avec les imports existants

export 'firebase_core_custom.dart';

// Certains imports peuvent s'attendre à trouver directement Firebase
// alors on le redéfinit ici
import 'firebase_core_custom.dart';

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Firebase Core Implementation
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
  final String? authDomain;
  final String? storageBucket;
  final String? databaseURL;
  final String? measurementId;
  final String? trackingId;
  final String? iosClientId;
  final String? iosBundleId;
  final String? androidClientId;
  
  const FirebaseOptions({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    this.authDomain,
    this.storageBucket,
    this.databaseURL,
    this.measurementId,
    this.trackingId,
    this.iosClientId,
    this.iosBundleId,
    this.androidClientId,
  });
  
  @override
  String toString() => 'FirebaseOptions(apiKey: $apiKey, appId: $appId)';
}

// Classe globale Firebase pour la compatibilité avec le plugin officiel
class Firebase {
  static FirebaseCoreCustom get instance => FirebaseCoreCustom.instance;
  
  // Méthodes statiques pour compatibilité avec le Firebase officiel
  static Future<FirebaseApp> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) {
    Map<String, dynamic>? optionsMap = options == null ? null : {
      'apiKey': options.apiKey,
      'appId': options.appId,
      'messagingSenderId': options.messagingSenderId,
      'projectId': options.projectId,
      'authDomain': options.authDomain,
      'storageBucket': options.storageBucket,
      'databaseURL': options.databaseURL,
      'measurementId': options.measurementId,
      'trackingId': options.trackingId,
      'iosClientId': options.iosClientId,
      'iosBundleId': options.iosBundleId,
      'androidClientId': options.androidClientId,
    };
    optionsMap?.removeWhere((key, value) => value == null);

    return instance.initializeApp(name: name, options: optionsMap);
  }
  
  static Future<List<FirebaseApp>> get apps => instance.apps;
  
  // Méthode pour obtenir une app par nom (compatibilité avec l'API officielle)
  static FirebaseApp app([String name = 'DEFAULT']) {
    // Dans cette implémentation simplifiée, on retourne juste une app par défaut
    return FirebaseApp(
      name: name,
      options: FirebaseOptions(
        apiKey: 'stub-api-key',
        appId: 'stub-app-id',
        messagingSenderId: 'stub-sender-id',
        projectId: 'stub-project-id',
      ),
    );
  }
}

// Ajouter la classe FirebaseException pour la compatibilité
class FirebaseException implements Exception {
  final String code;
  final String message;
  final String? plugin;
  
  FirebaseException({
    required this.code,
    required this.message,
    this.plugin,
  });
  
  @override
  String toString() => 'FirebaseException(code: $code, message: $message, plugin: $plugin)';
}

// Définition d'une constante pour la compatibilité
const String defaultFirebaseAppName = 'DEFAULT'; 