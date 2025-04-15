package fr.remibp.contactsservice;

import android.Manifest;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.provider.ContactsContract;
import android.provider.ContactsContract.CommonDataKinds;
import android.provider.ContactsContract.Contacts;
import android.provider.ContactsContract.RawContacts;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/** ContactsServicePlugin */
public class ContactsServicePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private MethodChannel channel;
    private Context context;
    private ContentResolver contentResolver;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "contacts_service");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
        contentResolver = context.getContentResolver();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getContacts")) {
            // Check permissions
            if (!hasPermission()) {
                result.error("PERMISSION_DENIED", "Permission to access contacts denied", null);
                return;
            }

            String query = call.argument("query");
            boolean withThumbnails = call.argument("withThumbnails");
            boolean orderByGivenName = call.argument("orderByGivenName");

            try {
                List<Map<String, Object>> contacts = getContacts(query, withThumbnails, orderByGivenName);
                result.success(contacts);
            } catch (Exception e) {
                result.error("CONTACTS_ERROR", e.getMessage(), null);
            }
        } else if (call.method.equals("getContact")) {
            // Check permissions
            if (!hasPermission()) {
                result.error("PERMISSION_DENIED", "Permission to access contacts denied", null);
                return;
            }

            String identifier = call.argument("identifier");
            boolean withThumbnails = call.argument("withThumbnails");

            try {
                Map<String, Object> contact = getContact(identifier, withThumbnails);
                if (contact != null) {
                    result.success(contact);
                } else {
                    result.error("CONTACT_NOT_FOUND", "Contact with identifier " + identifier + " not found", null);
                }
            } catch (Exception e) {
                result.error("CONTACTS_ERROR", e.getMessage(), null);
            }
        } else if (call.method.equals("addContact")) {
            // Stub implementation - would actually insert the contact
            result.success(null);
        } else if (call.method.equals("updateContact")) {
            // Stub implementation - would actually update the contact
            result.success(null);
        } else if (call.method.equals("deleteContact")) {
            // Stub implementation - would actually delete the contact
            result.success(null);
        } else if (call.method.equals("inviteContact")) {
            // Stub implementation - would handle the contact invitation
            result.success(true);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        context = null;
        contentResolver = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        // Not using activity in this implementation
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        // Not needed
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        // Not needed
    }

    @Override
    public void onDetachedFromActivity() {
        // Not needed
    }

    private boolean hasPermission() {
        return ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED;
    }

    private List<Map<String, Object>> getContacts(String query, boolean withThumbnails, boolean orderByGivenName) {
        List<Map<String, Object>> contactList = new ArrayList<>();
        
        // This is a simplified implementation - a real implementation would query the contacts database
        // and create the full list of contacts with all their details.
        
        // For now, just return an empty list to make the plugin work minimally
        return contactList;
    }
    
    private Map<String, Object> getContact(String identifier, boolean withThumbnails) {
        // This is a simplified implementation - a real implementation would query a specific contact
        // and return all its details.
        
        // For now, return null to indicate the contact wasn't found
        return null;
    }
} 