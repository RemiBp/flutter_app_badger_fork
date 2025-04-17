package io.flutter.plugins.firebase.core;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** FirebaseCorePlugin */
public class FirebaseCorePlugin implements FlutterPlugin, MethodCallHandler {
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/firebase_core");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("Firebase#initializeApp")) {
      initializeApp(call, result);
    } else if (call.method.equals("Firebase#apps")) {
      getApps(result);
    } else {
      result.notImplemented();
    }
  }

  private void initializeApp(MethodCall call, Result result) {
    Map<String, Object> arguments = call.arguments();
    String appName = (String) arguments.get("appName");
    
    if (appName == null) {
      appName = "[DEFAULT]";
    }
    
    // Return a mock initialized app
    Map<String, Object> appMap = new HashMap<>();
    appMap.put("name", appName);
    appMap.put("options", getDefaultOptions());
    
    result.success(appMap);
  }

  private void getApps(Result result) {
    // Return a list with just the default app
    ArrayList<Map<String, Object>> apps = new ArrayList<>();
    
    Map<String, Object> defaultApp = new HashMap<>();
    defaultApp.put("name", "[DEFAULT]");
    defaultApp.put("options", getDefaultOptions());
    
    apps.add(defaultApp);
    
    result.success(apps);
  }
  
  private Map<String, Object> getDefaultOptions() {
    Map<String, Object> options = new HashMap<>();
    options.put("apiKey", "mock-api-key");
    options.put("appId", "mock-app-id");
    options.put("messagingSenderId", "mock-sender-id");
    options.put("projectId", "mock-project-id");
    return options;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
} 