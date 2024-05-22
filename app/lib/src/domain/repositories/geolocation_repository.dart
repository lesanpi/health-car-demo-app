import 'dart:developer';

import 'package:health_car_demo_app/src/data/data_sources/geolocation/geolocation_api.dart';
import 'package:health_car_demo_app/src/domain/entities/user_geolocation.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IGeolocationRepository {
  String name = 'IGeolocationRepository';

  Future<UserGeolocation> getCurrentPosition();

  Future<bool> isGeolocationPermissionGranted();
}

class GeolocationRepository extends IGeolocationRepository {
  GeolocationRepository({
    required GeolocationApi geolocationApi,
  }) : _geolocationApi = geolocationApi;

  final GeolocationApi _geolocationApi;

  @override
  Future<UserGeolocation> getCurrentPosition() async {
    try {
      final position = await _geolocationApi.getCurrentPosition();

      final geolocation = UserGeolocation(
        longitude: position.longitude,
        latitude: position.latitude,
      );
      log(
        '📍 Current geolocation $geolocation',
        name: '$name.getCurrentPosition',
      );
      return geolocation;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isGeolocationPermissionGranted() {
    return Permission.location.isGranted;
  }
}
