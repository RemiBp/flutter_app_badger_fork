import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart' as platform_maps;
import 'cluster_item.dart';

class Cluster<T extends ClusterItem> {
  Cluster({required this.items}) {
    assert(items.isNotEmpty);
    isMultiple = items.length > 1;
  }

  factory Cluster.fromItems(List<T> items) {
    return Cluster<T>(items: items);
  }

  final List<T> items;
  late final bool isMultiple;

  String getId() {
    if (!isMultiple) {
      return items.first.toString();
    }
    return items.map((item) => item.toString()).join(',');
  }

  platform_maps.LatLng get location {
    if (!isMultiple) {
      return items.first.location;
    }

    double latitude = items.map((item) => item.location.latitude).reduce((v, e) => v + e) / items.length;
    double longitude = items.map((item) => item.location.longitude).reduce((v, e) => v + e) / items.length;
    return platform_maps.LatLng(latitude, longitude);
  }

  int get count => items.length;

  @override
  String toString() {
    return 'Cluster of $count items';
  }
}

class Geohash {
  static const String BASE32_CODES = '0123456789bcdefghjkmnpqrstuvwxyz';
  static const List<int> BITS = [16, 8, 4, 2, 1];

  static String encode(platform_maps.LatLng latLng, {int codeLength = 8}) {
    double latitude = latLng.latitude;
    double longitude = latLng.longitude;

    if (latitude >= 90.0 || latitude <= -90.0) {
      latitude = 0.0;
    }
    while (longitude >= 180.0) {
      longitude -= 360.0;
    }
    while (longitude < -180.0) {
      longitude += 360.0;
    }

    bool even = true;
    int bit = 0;
    int ch = 0;
    String geohash = '';

    double lat_min = -90, lat_max = 90;
    double lon_min = -180, lon_max = 180;

    while (geohash.length < codeLength) {
      if (even) {
        double lon_mid = (lon_min + lon_max) / 2;
        if (longitude >= lon_mid) {
          ch |= BITS[bit];
          lon_min = lon_mid;
        } else {
          lon_max = lon_mid;
        }
      } else {
        double lat_mid = (lat_min + lat_max) / 2;
        if (latitude >= lat_mid) {
          ch |= BITS[bit];
          lat_min = lat_mid;
        } else {
          lat_max = lat_mid;
        }
      }

      even = !even;

      if (bit < 4) {
        bit++;
      } else {
        geohash += BASE32_CODES[ch];
        bit = 0;
        ch = 0;
      }
    }

    return geohash;
  }
} 