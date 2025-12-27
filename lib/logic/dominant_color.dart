import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

class DominantColor {
  final Uint8List bytes;
  final int k;
  final int dominantColorsCount;

  DominantColor(this.bytes, {this.k = 2, this.dominantColorsCount = 1});

  List<Color> extractDominantColors() {
    // half of image is enough to pick all dominat colors
    List<Color> colors = _getPixelsColorsFromHalfImage();
    if (colors.isEmpty) return [const Color(0xFFFFFFFF)];

    List<Color> centroids = initializeCentroids(colors);
    List<Color> oldCentroids = [];

    int maxIterations = 20;
    int iteration = 0;

    while (_isConverging(centroids, oldCentroids) &&
        iteration < maxIterations) {
      oldCentroids = List.from(centroids);
      List<List<Color>> clusters = List.generate(k, (index) => []);

      for (var color in colors) {
        int closestIndex = _findClosestCentroid(color, centroids);
        clusters[closestIndex].add(color);
      }

      for (int i = 0; i < k; i++) {
        if (clusters[i].isNotEmpty) {
          centroids[i] = _averageColor(clusters[i]);
        }
      }
      iteration++;
    }
    return centroids;
  }

  int _findClosestCentroid(Color color, List<Color> centroids) {
    int minIndex = 0;
    double minDistance = distance(color, centroids[0]);
    for (int i = 1; i < centroids.length; i++) {
      double dist = distance(color, centroids[i]);
      if (dist < minDistance) {
        minDistance = dist;
        minIndex = i;
      }
    }
    return minIndex;
  }

  List<Color> initializeCentroids(List<Color> colors) {
    final random = Random();
    List<Color> centroids = [];
    if (colors.isEmpty) return [];

    // Pick first manually or random
    for (int i = 0; i < k; i++) {
      centroids.add(colors[random.nextInt(colors.length)]);
    }
    return centroids;
  }

  double distance(Color a, Color b) {
    return sqrt(pow(a.r - b.r, 2) + pow(a.g - b.g, 2) + pow(a.b - b.b, 2));
  }

  // Helpers

  List<Color> _getPixelsColorsFromHalfImage() {
    List<Color> colors = [];
    // Assuming bytes are RGBA or similar 4-byte format.
    // Iterating over half the bytes.
    // stride = 4 (R, G, B, A)
    int limit = bytes.length ~/ 2;
    // Align limit to 4 bytes
    limit = limit - (limit % 4);

    for (int i = 0; i < limit; i += 4) {
      // Basic check to ensure we have enough bytes
      if (i + 3 >= bytes.length) break;

      int r = bytes[i];
      int g = bytes[i + 1];
      int b = bytes[i + 2];
      int a = bytes[i + 3]; // Alpha

      // Skip transparent or near transparent pixels if needed, or just add them.
      // Usually background color detection might want to ignore transparent.
      if (a > 128) {
        // Only consider mostly opaque pixels
        colors.add(Color.fromARGB(a, r, g, b));
      }
    }
    return colors;
  }

  bool _isConverging(List<Color> centroids, List<Color> oldCentroids) {
    if (oldCentroids.length != centroids.length) return true;

    double totalDiff = 0;
    for (int i = 0; i < centroids.length; i++) {
      totalDiff += distance(centroids[i], oldCentroids[i]);
    }
    // If total difference is very small, we converged.
    return totalDiff > 1.0;
  }

  Color _averageColor(List<Color> colors) {
    if (colors.isEmpty) return const Color(0xFF000000);
    double sumR = 0;
    double sumG = 0;
    double sumB = 0;
    // We ignore alpha for centroid averaging usually, or average it too.

    for (var color in colors) {
      sumR += color.r;
      sumG += color.g;
      sumB += color.b;
    }

    return Color.fromARGB(
      255,
      (sumR / colors.length * 255).round(),
      (sumG / colors.length * 255).round(),
      (sumB / colors.length * 255).round(),
    );
  }
}
