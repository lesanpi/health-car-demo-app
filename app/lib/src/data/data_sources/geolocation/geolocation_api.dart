import 'package:geolocator/geolocator.dart';
import 'package:health_car_demo_app/src/data/models/location_model.dart';

abstract class GeolocationApi {
  GeolocationApi();
  Future<LocationModel> getCurrentPosition();
}
