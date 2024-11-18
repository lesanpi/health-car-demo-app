import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

class VehicleMeasure extends Equatable {
  const VehicleMeasure({
    required this.vehicleId,
    required this.kilometers,
    this.hasGpsSignal = false,
    this.scannerData,
  });
  final String? vehicleId;
  final int? kilometers;
  final bool hasGpsSignal;
  final CreateVehicleStatusDto? scannerData;

  @override
  List<Object?> get props => [vehicleId, kilometers, scannerData];
}
