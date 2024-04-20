import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  // For camera
  Future<void> requestCameraUsage() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }
  }

  Future<void> requestGalery() async {
    final status = await Permission.photos.status;
    if (status.isDenied) {
      await Permission.photos.request();
    }
  }

  Future<void> requestMicrophoneUsage() async {
    final status = await Permission.microphone.status;
    if (status.isDenied) {
      await Permission.microphone.request();
    }
  }

  Future<void> requestExternalStorageUsage() async {
    final status = await Permission.manageExternalStorage.status;
    if (status.isDenied) {
      await Permission.manageExternalStorage.request();
    }
  }

  Future<void> requestLocation() async {
    final status = await Permission.locationWhenInUse.serviceStatus.isEnabled;
    if (!status) {
      await Permission.location.request();

      log('Location service is not enabled');
    }
  }

  Future<void> requestContactUsage() async {
    final status = await Permission.contacts.status;
    if (status.isDenied) {
      await Permission.contacts.request();
    }
  }
}
