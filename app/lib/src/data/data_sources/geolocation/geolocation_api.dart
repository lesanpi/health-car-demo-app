import 'package:geolocator/geolocator.dart';

abstract class GeolocationApi {
  GeolocationApi();
  Future<Position> getCurrentPosition();
}
