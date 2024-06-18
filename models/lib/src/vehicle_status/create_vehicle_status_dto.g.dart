// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vehicle_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVehicleStatusDtoImpl _$$CreateVehicleStatusDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVehicleStatusDtoImpl(
      vehicle: json['vehicle'] as String,
      vin: json['vin'] as String?,
      milOn: json['milOn'] as bool?,
      kmMILOn: (json['kmMILOn'] as num?)?.toInt(),
      minutesMILOn: (json['minutesMILOn'] as num?)?.toInt(),
      milCodes: (json['milCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coolantTemperature: (json['coolantTemperature'] as num?)?.toDouble(),
      maf: (json['maf'] as num?)?.toDouble(),
      oilTemperature: (json['oilTemperature'] as num?)?.toDouble(),
      intakeAirTemperature: (json['intakeAirTemperature'] as num?)?.toDouble(),
      fuelPressure: (json['fuelPressure'] as num?)?.toDouble(),
      absBaroPressure: (json['absBaroPressure'] as num?)?.toDouble(),
      manifoldPressureKpa: (json['manifoldPressureKpa'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CreateVehicleStatusDtoImplToJson(
        _$CreateVehicleStatusDtoImpl instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'vin': instance.vin,
      'milOn': instance.milOn,
      'kmMILOn': instance.kmMILOn,
      'minutesMILOn': instance.minutesMILOn,
      'milCodes': instance.milCodes,
      'coolantTemperature': instance.coolantTemperature,
      'maf': instance.maf,
      'oilTemperature': instance.oilTemperature,
      'intakeAirTemperature': instance.intakeAirTemperature,
      'fuelPressure': instance.fuelPressure,
      'absBaroPressure': instance.absBaroPressure,
      'manifoldPressureKpa': instance.manifoldPressureKpa,
    };
