import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionManager {
  static requestLocationPermission(
      BuildContext context, VoidCallback onGranted) async {
    if (await Permission.location.request().isGranted) {
      onGranted();
    } else if (await Permission.location.request().isGranted){
      onGranted();
    }
  }
}