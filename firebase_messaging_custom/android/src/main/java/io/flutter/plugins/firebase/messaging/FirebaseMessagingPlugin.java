package io.flutter.plugins.firebase.messaging;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FirebaseMessagingPlugin */
public class FirebaseMessagingPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/firebase_messaging");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // This is a stub implementation to avoid Android Gradle issues
    switch (call.method) {
      case "requestPermission":
      case "getNotificationSettings":
      case "getToken":
      case "deleteToken":
      case "subscribeToTopic":
      case "unsubscribeFromTopic":
      case "setAutoInitEnabled":
      case "getInitialMessage":
      case "setForegroundNotificationPresentationOptions":
        // Return successful dummy values for all methods
        result.success(null);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
} 