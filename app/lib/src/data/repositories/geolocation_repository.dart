import 'dart:developer';

import 'package:health_car_demo_app/src/data/data_sources/geolocation/geolocation_api.dart';
import 'package:health_car_demo_app/src/domain/entities/user_geolocation.dart';
import 'package:health_car_demo_app/src/domain/repositories/geolocation_repository.dart';
import 'package:models/models.dart';
import 'package:permission_handler/permission_handler.dart';

class GeolocationRepository extends IGeolocationRepository {
  GeolocationRepository({
    required GeolocationApi geolocationApi,
  }) : _geolocationApi = geolocationApi;

  final GeolocationApi _geolocationApi;

  @override
  Future<Geolocation?> getCurrentPosition() async {
    try {
      final position = await _geolocationApi.getCurrentPosition();

      final geolocation = Geolocation(
        long: position.long,
        lat: position.lat,
      );
      log(
        '📍 Current geolocation $geolocation',
        name: '$name.getCurrentPosition',
      );
      return geolocation;
    } catch (e) {
      log(
        'Exception getting location $e',
        name: '$name.getCurrentPosition',
        error: e,
      );
      return null;
      // rethrow;
    }
  }

  @override
  Future<bool> isGeolocationPermissionGranted() {
    return Permission.location.isGranted;
  }
}
