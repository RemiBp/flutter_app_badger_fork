package com.cloudwebrtc.webrtc;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterWebRTCPlugin */
public class FlutterWebRTCPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/flutter_webrtc");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // This is a stub implementation to avoid Android Gradle issues
    switch (call.method) {
      case "createPeerConnection":
      case "mediaStreamGetTracks":
      case "createOffer":
      case "createAnswer":
      case "addStream":
      case "removeStream":
      case "setLocalDescription":
      case "setRemoteDescription":
      case "addCandidate":
      case "getStats":
      case "createDataChannel":
      case "getUserMedia":
      case "getSources":
      case "setMicrophoneMute":
      case "switchCamera":
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