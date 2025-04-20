package com.fintasys.emoji_picker_flutter;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** EmojiPickerFlutterPlugin */
public class EmojiPickerFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "emoji_picker_flutter_custom");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    // This is a wrapper plugin, so we just forward to the original emoji_picker_flutter
    // No implementation needed as we're just using the original emoji_picker_flutter plugin
    result.notImplemented();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
} 