// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleStatus _$VehicleStatusFromJson(Map<String, dynamic> json) {
  return _VehicleStatus.fromJson(json);
}

/// @nodoc
mixin _$VehicleStatus {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get vehicle => throw _privateConstructorUsedError;
  String get vin => throw _privateConstructorUsedError;
  bool get milOn => throw _privateConstructorUsedError;
  List<String> get milCodes => throw _privateConstructorUsedError;
  double? get coolantTemperature => throw _privateConstructorUsedError;
  double? get oilTemperature => throw _privateConstructorUsedError;
  double? get intakeAirTemperature => throw _privateConstructorUsedError;
  double? get fuelPressure => throw _privateConstructorUsedError;
  double? get absBaroPressure => throw _privateConstructorUsedError;
  double? get manifoldPressureKpa => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get kmMILOn => throw _privateConstructorUsedError;
  int get minutesMILOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleStatusCopyWith<VehicleStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleStatusCopyWith<$Res> {
  factory $VehicleStatusCopyWith(
          VehicleStatus value, $Res Function(VehicleStatus) then) =
      _$VehicleStatusCopyWithImpl<$Res, VehicleStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String vehicle,
      String vin,
      bool milOn,
      List<String> milCodes,
      double? coolantTemperature,
      double? oilTemperature,
      double? intakeAirTemperature,
      double? fuelPressure,
      double? absBaroPressure,
      double? manifoldPressureKpa,
      DateTime createdAt,
      int kmMILOn,
      int minutesMILOn});
}

/// @nodoc
class _$VehicleStatusCopyWithImpl<$Res, $Val extends VehicleStatus>
    implements $VehicleStatusCopyWith<$Res> {
  _$VehicleStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? vin = null,
    Object? milOn = null,
    Object? milCodes = null,
    Object? coolantTemperature = freezed,
    Object? oilTemperature = freezed,
    Object? intakeAirTemperature = freezed,
    Object? fuelPressure = freezed,
    Object? absBaroPressure = freezed,
    Object? manifoldPressureKpa = freezed,
    Object? createdAt = null,
    Object? kmMILOn = null,
    Object? minutesMILOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      vin: null == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String,
      milOn: null == milOn
          ? _value.milOn
          : milOn // ignore: cast_nullable_to_non_nullable
              as bool,
      milCodes: null == milCodes
          ? _value.milCodes
          : milCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coolantTemperature: freezed == coolantTemperature
          ? _value.coolantTemperature
          : coolantTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      oilTemperature: freezed == oilTemperature
          ? _value.oilTemperature
          : oilTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      intakeAirTemperature: freezed == intakeAirTemperature
          ? _value.intakeAirTemperature
          : intakeAirTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      fuelPressure: freezed == fuelPressure
          ? _value.fuelPressure
          : fuelPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      absBaroPressure: freezed == absBaroPressure
          ? _value.absBaroPressure
          : absBaroPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      manifoldPressureKpa: freezed == manifoldPressureKpa
          ? _value.manifoldPressureKpa
          : manifoldPressureKpa // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kmMILOn: null == kmMILOn
          ? _value.kmMILOn
          : kmMILOn // ignore: cast_nullable_to_non_nullable
              as int,
      minutesMILOn: null == minutesMILOn
          ? _value.minutesMILOn
          : minutesMILOn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleStatusImplCopyWith<$Res>
    implements $VehicleStatusCopyWith<$Res> {
  factory _$$VehicleStatusImplCopyWith(
          _$VehicleStatusImpl value, $Res Function(_$VehicleStatusImpl) then) =
      __$$VehicleStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String vehicle,
      String vin,
      bool milOn,
      List<String> milCodes,
      double? coolantTemperature,
      double? oilTemperature,
      double? intakeAirTemperature,
      double? fuelPressure,
      double? absBaroPressure,
      double? manifoldPressureKpa,
      DateTime createdAt,
      int kmMILOn,
      int minutesMILOn});
}

/// @nodoc
class __$$VehicleStatusImplCopyWithImpl<$Res>
    extends _$VehicleStatusCopyWithImpl<$Res, _$VehicleStatusImpl>
    implements _$$VehicleStatusImplCopyWith<$Res> {
  __$$VehicleStatusImplCopyWithImpl(
      _$VehicleStatusImpl _value, $Res Function(_$VehicleStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? vin = null,
    Object? milOn = null,
    Object? milCodes = null,
    Object? coolantTemperature = freezed,
    Object? oilTemperature = freezed,
    Object? intakeAirTemperature = freezed,
    Object? fuelPressure = freezed,
    Object? absBaroPressure = freezed,
    Object? manifoldPressureKpa = freezed,
    Object? createdAt = null,
    Object? kmMILOn = null,
    Object? minutesMILOn = null,
  }) {
    return _then(_$VehicleStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      vin: null == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String,
      milOn: null == milOn
          ? _value.milOn
          : milOn // ignore: cast_nullable_to_non_nullable
              as bool,
      milCodes: null == milCodes
          ? _value._milCodes
          : milCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      coolantTemperature: freezed == coolantTemperature
          ? _value.coolantTemperature
          : coolantTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      oilTemperature: freezed == oilTemperature
          ? _value.oilTemperature
          : oilTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      intakeAirTemperature: freezed == intakeAirTemperature
          ? _value.intakeAirTemperature
          : intakeAirTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      fuelPressure: freezed == fuelPressure
          ? _value.fuelPressure
          : fuelPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      absBaroPressure: freezed == absBaroPressure
          ? _value.absBaroPressure
          : absBaroPressure // ignore: cast_nullable_to_non_nullable
              as double?,
      manifoldPressureKpa: freezed == manifoldPressureKpa
          ? _value.manifoldPressureKpa
          : manifoldPressureKpa // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      kmMILOn: null == kmMILOn
          ? _value.kmMILOn
          : kmMILOn // ignore: cast_nullable_to_non_nullable
              as int,
      minutesMILOn: null == minutesMILOn
          ? _value.minutesMILOn
          : minutesMILOn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleStatusImpl implements _VehicleStatus {
  const _$VehicleStatusImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.vehicle,
      required this.vin = '',
      required this.milOn,
      required final List<String> milCodes = const [],
      required this.coolantTemperature,
      required this.oilTemperature,
      required this.intakeAirTemperature,
      required this.fuelPressure,
      required this.absBaroPressure,
      required this.manifoldPressureKpa,
      required this.createdAt,
      this.kmMILOn = 0,
      this.minutesMILOn = 0})
      : _milCodes = milCodes;

  factory _$VehicleStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleStatusImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String vehicle;
  @override
  @JsonKey()
  final String vin;
  @override
  final bool milOn;
  final List<String> _milCodes;
  @override
  @JsonKey()
  List<String> get milCodes {
    if (_milCodes is EqualUnmodifiableListView) return _milCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_milCodes);
  }

  @override
  final double? coolantTemperature;
  @override
  final double? oilTemperature;
  @override
  final double? intakeAirTemperature;
  @override
  final double? fuelPressure;
  @override
  final double? absBaroPressure;
  @override
  final double? manifoldPressureKpa;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int kmMILOn;
  @override
  @JsonKey()
  final int minutesMILOn;

  @override
  String toString() {
    return 'VehicleStatus(id: $id, vehicle: $vehicle, vin: $vin, milOn: $milOn, milCodes: $milCodes, coolantTemperature: $coolantTemperature, oilTemperature: $oilTemperature, intakeAirTemperature: $intakeAirTemperature, fuelPressure: $fuelPressure, absBaroPressure: $absBaroPressure, manifoldPressureKpa: $manifoldPressureKpa, createdAt: $createdAt, kmMILOn: $kmMILOn, minutesMILOn: $minutesMILOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.milOn, milOn) || other.milOn == milOn) &&
            const DeepCollectionEquality().equals(other._milCodes, _milCodes) &&
            (identical(other.coolantTemperature, coolantTemperature) ||
                other.coolantTemperature == coolantTemperature) &&
            (identical(other.oilTemperature, oilTemperature) ||
                other.oilTemperature == oilTemperature) &&
            (identical(other.intakeAirTemperature, intakeAirTemperature) ||
                other.intakeAirTemperature == intakeAirTemperature) &&
            (identical(other.fuelPressure, fuelPressure) ||
                other.fuelPressure == fuelPressure) &&
            (identical(other.absBaroPressure, absBaroPressure) ||
                other.absBaroPressure == absBaroPressure) &&
            (identical(other.manifoldPressureKpa, manifoldPressureKpa) ||
                other.manifoldPressureKpa == manifoldPressureKpa) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.kmMILOn, kmMILOn) || other.kmMILOn == kmMILOn) &&
            (identical(other.minutesMILOn, minutesMILOn) ||
                other.minutesMILOn == minutesMILOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      vehicle,
      vin,
      milOn,
      const DeepCollectionEquality().hash(_milCodes),
      coolantTemperature,
      oilTemperature,
      intakeAirTemperature,
      fuelPressure,
      absBaroPressure,
      manifoldPressureKpa,
      createdAt,
      kmMILOn,
      minutesMILOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleStatusImplCopyWith<_$VehicleStatusImpl> get copyWith =>
      __$$VehicleStatusImplCopyWithImpl<_$VehicleStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleStatusImplToJson(
      this,
    );
  }
}

abstract class _VehicleStatus implements VehicleStatus {
  const factory _VehicleStatus(
      {@JsonKey(name: '_id') required final String id,
      required final String vehicle,
      required final String vin,
      required final bool milOn,
      required final List<String> milCodes,
      required final double? coolantTemperature,
      required final double? oilTemperature,
      required final double? intakeAirTemperature,
      required final double? fuelPressure,
      required final double? absBaroPressure,
      required final double? manifoldPressureKpa,
      required final DateTime createdAt,
      final int kmMILOn,
      final int minutesMILOn}) = _$VehicleStatusImpl;

  factory _VehicleStatus.fromJson(Map<String, dynamic> json) =
      _$VehicleStatusImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get vehicle;
  @override
  String get vin;
  @override
  bool get milOn;
  @override
  List<String> get milCodes;
  @override
  double? get coolantTemperature;
  @override
  double? get oilTemperature;
  @override
  double? get intakeAirTemperature;
  @override
  double? get fuelPressure;
  @override
  double? get absBaroPressure;
  @override
  double? get manifoldPressureKpa;
  @override
  DateTime get createdAt;
  @override
  int get kmMILOn;
  @override
  int get minutesMILOn;
  @override
  @JsonKey(ignore: true)
  _$$VehicleStatusImplCopyWith<_$VehicleStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
