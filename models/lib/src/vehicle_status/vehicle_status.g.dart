// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleStatusImpl _$$VehicleStatusImplFromJson(Map<String, dynamic> json) =>
    _$VehicleStatusImpl(
      id: json['_id'] as String,
      vehicle: json['vehicle'] as String,
      vin: json['vin'] as String? ?? '',
      milOn: json['milOn'] as bool,
      milCodes: (json['milCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      coolantTemperature: (json['coolantTemperature'] as num?)?.toDouble(),
      oilTemperature: (json['oilTemperature'] as num?)?.toDouble(),
      intakeAirTemperature: (json['intakeAirTemperature'] as num?)?.toDouble(),
      fuelPressure: (json['fuelPressure'] as num?)?.toDouble(),
      absBaroPressure: (json['absBaroPressure'] as num?)?.toDouble(),
      manifoldPressureKpa: (json['manifoldPressureKpa'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      kmMILOn: (json['kmMILOn'] as num?)?.toInt() ?? 0,
      minutesMILOn: (json['minutesMILOn'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$VehicleStatusImplToJson(_$VehicleStatusImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'vehicle': instance.vehicle,
      'vin': instance.vin,
      'milOn': instance.milOn,
      'milCodes': instance.milCodes,
      'coolantTemperature': instance.coolantTemperature,
      'oilTemperature': instance.oilTemperature,
      'intakeAirTemperature': instance.intakeAirTemperature,
      'fuelPressure': instance.fuelPressure,
      'absBaroPressure': instance.absBaroPressure,
      'manifoldPressureKpa': instance.manifoldPressureKpa,
      'createdAt': instance.createdAt.toIso8601String(),
      'kmMILOn': instance.kmMILOn,
      'minutesMILOn': instance.minutesMILOn,
    };
