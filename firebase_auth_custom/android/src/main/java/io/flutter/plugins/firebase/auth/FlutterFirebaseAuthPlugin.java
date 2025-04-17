package io.flutter.plugins.firebase.auth;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterFirebaseAuthPlugin */
public class FlutterFirebaseAuthPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/firebase_auth");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // This is a stub implementation that just returns success for all method calls
    if (call.method.equals("signInAnonymously")) {
      // Return stub user credential
      result.success(null);
    } else if (call.method.equals("signInWithCredential")) {
      // Return stub user credential
      result.success(null);
    } else if (call.method.equals("signInWithCustomToken")) {
      // Return stub user credential
      result.success(null);
    } else if (call.method.equals("signInWithEmailAndPassword")) {
      // Return stub user credential
      result.success(null);
    } else if (call.method.equals("createUserWithEmailAndPassword")) {
      // Return stub user credential
      result.success(null);
    } else if (call.method.equals("signOut")) {
      // Return success
      result.success(null);
    } else if (call.method.equals("getIdToken")) {
      // Return stub token
      result.success("stub-token");
    } else if (call.method.equals("sendPasswordResetEmail")) {
      // Return success
      result.success(null);
    } else if (call.method.equals("verifyPasswordResetCode")) {
      // Return stub email
      result.success("stub@example.com");
    } else if (call.method.equals("confirmPasswordReset")) {
      // Return success
      result.success(null);
    } else if (call.method.equals("fetchSignInMethodsForEmail")) {
      // Return empty list
      result.success(java.util.Arrays.asList());
    } else if (call.method.equals("sendEmailVerification")) {
      // Return success
      result.success(null);
    } else if (call.method.equals("verifyPhoneNumber")) {
      // Return stub verification ID
      result.success("stub-verification-id");
    } else {
      // For all other methods, just return success
      result.success(null);
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
} 