import 'package:models/models.dart';

abstract class IGeolocationRepository {
  String name = 'IGeolocationRepository';

  Future<Geolocation?> getCurrentPosition();

  Future<bool> isGeolocationPermissionGranted();
}
