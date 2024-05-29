import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:health_car_demo_app/src/data/data_sources/geolocation/geolocation_api.dart';
import 'package:health_car_demo_app/src/data/models/location_model.dart';

class GeolocationApiPlugin extends GeolocationApi {
  @override
  Future<LocationModel> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location = await Geolocator.getCurrentPosition();
    // final location = await getFirstPosition();
    log(
      'Location received $location',
      name: 'GeolocationApi',
    );

    return LocationModel(lat: location.latitude, long: location.longitude);
  }

  Future<Position?> getFirstPosition() async {
    late LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 1),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: 'Running in Background',
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    StreamSubscription<Position?>? positionStreamSubscription;

    try {
      Position? positionReceived;
      positionStreamSubscription = Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen((Position? position) {
        log('Position stream received $position', name: 'GeolocationApi');
        if (position != null) {
          positionStreamSubscription
              ?.cancel(); // Stop listening after first position
          positionReceived = position;
        } // Print unknown if no position received
      });

      // Wait for a position or timeout (optional)
      await Future<void>.delayed(
        const Duration(seconds: 5),
      ); // Adjust timeout as needed
      await positionStreamSubscription
          .cancel(); // Cancel if no position in timeout

      return positionReceived; // No position received within timeout
    } finally {
      await positionStreamSubscription?.cancel(); // Ensure stream is cancelled
    }
  }
}
