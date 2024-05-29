import 'package:fl_location/fl_location.dart';
import 'package:health_car_demo_app/src/data/data_sources/geolocation/geolocation_api.dart';
import 'package:health_car_demo_app/src/data/models/location_model.dart';

class FlGeolocationApi extends GeolocationApi {
  @override
  Future<LocationModel> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await FlLocation.isLocationServicesEnabled;
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await FlLocation.checkLocationPermission();
    if (permission == LocationPermission.denied) {
      permission = await FlLocation.requestLocationPermission();
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
    final location = await FlLocation.getLocation();
    return LocationModel(lat: location.latitude, long: location.longitude);
  }
}
