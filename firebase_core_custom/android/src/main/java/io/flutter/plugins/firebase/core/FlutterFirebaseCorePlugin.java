package io.flutter.plugins.firebase.core;

import android.content.Context;
import androidx.annotation.NonNull;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** FlutterFirebaseCorePlugin */
public class FlutterFirebaseCorePlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;
    private Context applicationContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/firebase_core");
        channel.setMethodCallHandler(this);
        applicationContext = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("Firebase#initializeApp")) {
            initializeApp(call, result);
        } else if (call.method.equals("Firebase#initializeCore")) {
            initializeCore(result);
        } else if (call.method.equals("Firebase#apps")) {
            getApps(result);
        } else {
            result.notImplemented();
        }
    }

    private void initializeApp(MethodCall call, Result result) {
        // Instead of actually initializing Firebase, we return stub data
        Map<String, Object> arguments = call.arguments();
        
        String appName = (String) arguments.get("appName");
        Map<String, Object> optionsMap = (Map<String, Object>) arguments.get("options");
        
        if (appName == null || appName.equals("[DEFAULT]")) {
            appName = "[DEFAULT]";
        }
        
        // Return a mock initialized app
        Map<String, Object> appMap = new HashMap<>();
        appMap.put("name", appName);
        appMap.put("options", optionsMap != null ? optionsMap : getDefaultOptions());
        
        result.success(appMap);
    }
    
    private void initializeCore(Result result) {
        // Return a list with just the default app
        ArrayList<Map<String, Object>> apps = new ArrayList<>();
        
        Map<String, Object> defaultApp = new HashMap<>();
        defaultApp.put("name", "[DEFAULT]");
        defaultApp.put("options", getDefaultOptions());
        
        apps.add(defaultApp);
        
        result.success(apps);
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
        applicationContext = null;
    }
} 