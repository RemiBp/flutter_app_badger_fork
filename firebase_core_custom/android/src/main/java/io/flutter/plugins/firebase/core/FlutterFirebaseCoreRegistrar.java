package io.flutter.plugins.firebase.core;

import com.google.firebase.components.ComponentRegistrar;
import com.google.firebase.platforminfo.LibraryVersionComponent;
import java.util.Collections;
import java.util.List;
import androidx.annotation.Keep;

@Keep
public class FlutterFirebaseCoreRegistrar implements ComponentRegistrar {
  private static final String LIBRARY_NAME = "flutter-fire-core";
  private static final String LIBRARY_VERSION = "2.15.1";

  @Override
  public List<com.google.firebase.components.Component<?>> getComponents() {
    return Collections.singletonList(
        LibraryVersionComponent.create(LIBRARY_NAME, LIBRARY_VERSION));
  }
} 