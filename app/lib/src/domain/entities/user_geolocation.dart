import 'dart:math';

import 'package:equatable/equatable.dart';

class UserGeolocation extends Equatable {
  const UserGeolocation({
    required this.longitude,
    required this.latitude,
  });
  final double longitude;
  final double latitude;

  double distance(UserGeolocation other) =>
      _distanceBetween(latitude, longitude, other.latitude, other.longitude);

  double _distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    const earthRadius = 6378137.0;
    final dLat = _toRadians(endLatitude - startLatitude);
    final dLon = _toRadians(endLongitude - startLongitude);

    final a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude));
    final c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}
