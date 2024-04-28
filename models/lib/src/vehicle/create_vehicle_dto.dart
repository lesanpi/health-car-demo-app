import 'package:freezed_annotation/freezed_annotation.dart';

 
part 'create_vehicle_dto.freezed.dart';
part 'create_vehicle_dto.g.dart';

/// {@template create_vehicle_dto}
/// CreateVehicleDto description
/// {@endtemplate}
@freezed
class CreateVehicleDto with _$CreateVehicleDto {
  /// {@macro create_vehicle_dto}
  const factory CreateVehicleDto({ 
    required String name,
    required String photo,
  }) = _CreateVehicleDto;
  
    /// Creates a CreateVehicleDto from Json map
  factory CreateVehicleDto.fromJson(Map<String, dynamic> data) => _$CreateVehicleDtoFromJson(data);
}
