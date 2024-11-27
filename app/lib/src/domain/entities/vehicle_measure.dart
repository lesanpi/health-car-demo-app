import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:models/models.dart';

class VehicleMeasure extends Equatable {
  const VehicleMeasure({
    required this.vehicleId,
    required this.kilometers,
    required this.device,
    this.hasGpsSignal = false,
    this.scannerData,
  });
  final String? vehicleId;
  final int? kilometers;
  final bool hasGpsSignal;
  final CreateVehicleStatusDto? scannerData;
  final BluetoothDevice device;

  @override
  List<Object?> get props => [vehicleId, kilometers, scannerData];
}
