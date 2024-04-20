/// PlayStatus enum.
enum PlayStatus { init, playing, pause, stop, downloading, downloadError }

/// PlaySpeed enum.
enum PlaySpeed {
  x1,
  x1_5,
  x2,
}

/// Get the speed of the voice playback.
extension GetSpeed on PlaySpeed {
  double get getSpeed {
    switch (this) {
      case PlaySpeed.x1:
        return 1;
      case PlaySpeed.x1_5:
        return 1.50;
      case PlaySpeed.x2:
        return 2;
    }
  }

  /// Get the speed of the voice playback.
  String get playSpeedStr {
    switch (this) {
      case PlaySpeed.x1:
        return '1.00x';
      case PlaySpeed.x1_5:
        return '1.50x';
      case PlaySpeed.x2:
        return '2.00x';
    }
  }
}
