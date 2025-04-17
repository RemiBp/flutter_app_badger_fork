package io.flutter.plugins.firebase.core;

import androidx.annotation.NonNull;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** FlutterFirebaseCorePlugin */
public class FlutterFirebaseCorePlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "plugins.flutter.io/firebase_core");
        channel.setMethodCallHandler(this);
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
        Map<String, Object> arguments = call.arguments();
        
        String appName = (String) arguments.get("appName");
        Map<String, Object> optionsMap = (Map<String, Object>) arguments.get("options");
        
        FirebaseOptions options = getOptionsFromMap(optionsMap);
        
        FirebaseApp app;
        if (appName == null || appName.equals("[DEFAULT]")) {
            app = FirebaseApp.initializeApp(options);
        } else {
            app = FirebaseApp.initializeApp(options, appName);
        }
        
        result.success(mapFromFirebaseApp(app));
    }
    
    private void initializeCore(Result result) {
        List<FirebaseApp> apps = FirebaseApp.getApps();
        Map<String, Object> appsList = new HashMap<>();
        
        for (FirebaseApp app : apps) {
            appsList.put(app.getName(), mapFromFirebaseApp(app));
        }
        
        result.success(appsList);
    }
    
    private void getApps(Result result) {
        List<FirebaseApp> apps = FirebaseApp.getApps();
        Map<String, Object> appsList = new HashMap<>();
        
        for (FirebaseApp app : apps) {
            appsList.put(app.getName(), mapFromFirebaseApp(app));
        }
        
        result.success(appsList);
    }
    
    private Map<String, Object> mapFromFirebaseApp(FirebaseApp app) {
        Map<String, Object> appMap = new HashMap<>();
        
        appMap.put("name", app.getName());
        appMap.put("options", mapFromFirebaseOptions(app.getOptions()));
        
        return appMap;
    }
    
    private Map<String, Object> mapFromFirebaseOptions(FirebaseOptions options) {
        Map<String, Object> optionsMap = new HashMap<>();
        
        optionsMap.put("apiKey", options.getApiKey());
        optionsMap.put("appId", options.getApplicationId());
        optionsMap.put("messagingSenderId", options.getGcmSenderId());
        optionsMap.put("projectId", options.getProjectId());
        
        if (options.getStorageBucket() != null) {
            optionsMap.put("storageBucket", options.getStorageBucket());
        }
        
        if (options.getDatabaseUrl() != null) {
            optionsMap.put("databaseURL", options.getDatabaseUrl());
        }
        
        return optionsMap;
    }
    
    private FirebaseOptions getOptionsFromMap(Map<String, Object> optionsMap) {
        FirebaseOptions.Builder builder = new FirebaseOptions.Builder();
        
        builder.setApiKey((String) optionsMap.get("apiKey"));
        builder.setApplicationId((String) optionsMap.get("appId"));
        builder.setGcmSenderId((String) optionsMap.get("messagingSenderId"));
        builder.setProjectId((String) optionsMap.get("projectId"));
        
        if (optionsMap.containsKey("storageBucket")) {
            builder.setStorageBucket((String) optionsMap.get("storageBucket"));
        }
        
        if (optionsMap.containsKey("databaseURL")) {
            builder.setDatabaseUrl((String) optionsMap.get("databaseURL"));
        }
        
        return builder.build();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
} 