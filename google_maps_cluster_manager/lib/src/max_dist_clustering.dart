import 'dart:math';

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';

class MaxDistClustering<T extends ClusterItem> {
  MaxDistClustering({this.epsilon = 20});
  final double epsilon;

  List<Cluster<T>> run(List<T> items, int zoomLevel) {
    List<Cluster<T>> results = [];
    List<T> unprocessed = List.from(items);

    // This level is for the current zoom level
    double eps = (epsilon / pow(2, zoomLevel)) * 2;

    // For each point that isnot already categoried check if there
    // are neightbours
    while (unprocessed.isNotEmpty) {
      T p = unprocessed.removeLast();
      List<T> cluster = [p];

      // Interate through the unprocessed items
      for (int i = 0; i < unprocessed.length; i++) {
        T up = unprocessed[i];
        double dist = _dist(p.location.latitude, p.location.longitude,
            up.location.latitude, up.location.longitude);

        // Check if the euclidean distance is in epsilon range
        if (dist < eps) {
          // Add it to the cluster
          cluster.add(up);
          // Remove the item from unprocessed
          unprocessed.removeAt(i);
          i--;
        }
      }
      // Create a new cluster
      results.add(Cluster<T>.fromItems(cluster));
    }

    return results;
  }

  double _dist(double lat1, double lng1, double lat2, double lng2) {
    return sqrt(pow(lat1 - lat2, 2) + pow(lng1 - lng2, 2));
  }
} 