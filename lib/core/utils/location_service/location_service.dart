import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';

abstract class LocationService {
  //for checking if location is enabled or not
  static Future<bool> _isLocationEnabled() async =>
      await Geolocator.isLocationServiceEnabled();

  static Future<bool> _checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return false;
        } else {
          return true;
        }
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        return false;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return true;
    }
  }

  static Future<bool> _ensureLocationAccess() async {
    bool serviceEnabled = await _isLocationEnabled();
    if (!serviceEnabled) return false;

    bool permissionGranted = await _checkAndRequestLocationPermission();
    if (!permissionGranted) return false;
    return true;
  }

  static Future<LatLng> checkLocation(BuildContext context) async {
    bool access = await _ensureLocationAccess();
    if (access) {
      Position position = await Geolocator.getCurrentPosition();
      log("Your location: ${position.latitude}, ${position.longitude}");
      return LatLng(position.latitude, position.longitude);
    } else {
      if (context.mounted) {
        showSnackBar(context, "Please turn on your location");
      }
      return LatLng(31.2026, 29.9187);
    }
  }
}
