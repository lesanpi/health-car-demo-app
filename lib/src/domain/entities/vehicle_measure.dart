import 'package:equatable/equatable.dart';

class VehicleMeasure extends Equatable {
  const VehicleMeasure({
    required this.vehicleId,
    required this.kilometers,
  });
  final String vehicleId;
  final int kilometers;

  @override
  List<Object> get props => [vehicleId, kilometers];
}
