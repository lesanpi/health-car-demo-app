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
              .toList() ??
          [],
      coolantTemperature: (json['coolantTemperature'] as num?)?.toDouble(),
      maf: (json['maf'] as num?)?.toDouble(),
      oilTemperature: (json['oilTemperature'] as num?)?.toDouble(),
      intakeAirTemperature: (json['intakeAirTemperature'] as num?)?.toDouble(),
      fuelPressure: (json['fuelPressure'] as num?)?.toDouble(),
      absBaroPressure: (json['absBaroPressure'] as num?)?.toDouble(),
      manifoldPressureKpa: (json['manifoldPressureKpa'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CreateVehicleStatusDtoImplToJson(
    _$CreateVehicleStatusDtoImpl instance) {
  final val = <String, dynamic>{
    'vehicle': instance.vehicle,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vin', instance.vin);
  writeNotNull('milOn', instance.milOn);
  writeNotNull('kmMILOn', instance.kmMILOn);
  writeNotNull('minutesMILOn', instance.minutesMILOn);
  val['milCodes'] = instance.milCodes;
  writeNotNull('coolantTemperature', instance.coolantTemperature);
  writeNotNull('maf', instance.maf);
  writeNotNull('oilTemperature', instance.oilTemperature);
  writeNotNull('intakeAirTemperature', instance.intakeAirTemperature);
  writeNotNull('fuelPressure', instance.fuelPressure);
  writeNotNull('absBaroPressure', instance.absBaroPressure);
  writeNotNull('manifoldPressureKpa', instance.manifoldPressureKpa);
  return val;
}
