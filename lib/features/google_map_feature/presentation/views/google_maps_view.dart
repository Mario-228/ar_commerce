import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_new_version/core/utils/location_service/location_service.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng _selectedLatLng = const LatLng(31.2026, 29.9187);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment(0.95, -0.95),
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(31.2026, 29.9187),
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMove: (position) {
                _selectedLatLng = position.target;
              },
            ),
            GestureDetector(
                onTap: () async => await getAddressFromLatLng(context),
                child: Center(
                    child:
                        Icon(Icons.location_on, size: 40, color: Colors.red))),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () async => await goToMyLocation(context),
              child: Icon(Icons.my_location, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Future<void> goToMyLocation(BuildContext context) async {
    final GoogleMapController controller = await _controller.future;
    late LatLng position;
    if (context.mounted) {
      position = await LocationService.checkLocation(context);
    }
    if (position == LatLng(31.2026, 29.9187)) return;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 14.0,
        ),
      ),
    );
  }

  Future<void> getAddressFromLatLng(BuildContext context) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _selectedLatLng.latitude,
        _selectedLatLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        final address = [
          place.name,
          place.street,
          place.subLocality,
          place.locality,
          place.administrativeArea,
          place.country
        ].where((e) => e != null && e.isNotEmpty).join(', ');
        if (context.mounted) GoRouter.of(context).pop(address);
      } else {
        log("placemarks list is empty");
      }
    } catch (e) {
      log("Error in reverse geocoding: $e");
    }
  }
}
