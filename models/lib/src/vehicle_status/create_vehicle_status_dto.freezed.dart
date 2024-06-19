// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_vehicle_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVehicleStatusDto _$CreateVehicleStatusDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateVehicleStatusDto.fromJson(json);
}

/// @nodoc
mixin _$CreateVehicleStatusDto {
  String get vehicle => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get vin => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get milOn => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get kmMILOn => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int? get minutesMILOn => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<String>? get milCodes => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get coolantTemperature => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get maf => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get oilTemperature => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get intakeAirTemperature => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get fuelPressure => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get absBaroPressure => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  double? get manifoldPressureKpa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateVehicleStatusDtoCopyWith<CreateVehicleStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVehicleStatusDtoCopyWith<$Res> {
  factory $CreateVehicleStatusDtoCopyWith(CreateVehicleStatusDto value,
          $Res Function(CreateVehicleStatusDto) then) =
      _$CreateVehicleStatusDtoCopyWithImpl<$Res, CreateVehicleStatusDto>;
  @useResult
  $Res call(
      {String vehicle,
      @JsonKey(includeIfNull: false) String? vin,
      @JsonKey(includeIfNull: false) bool? milOn,
      @JsonKey(includeIfNull: false) int? kmMILOn,
      @JsonKey(includeIfNull: false) int? minutesMILOn,
      @JsonKey(defaultValue: []) List<String>? milCodes,
      @JsonKey(includeIfNull: false) double? coolantTemperature,
      @JsonKey(includeIfNull: false) double? maf,
      @JsonKey(includeIfNull: false) double? oilTemperature,
      @JsonKey(includeIfNull: false) double? intakeAirTemperature,
      @JsonKey(includeIfNull: false) double? fuelPressure,
      @JsonKey(includeIfNull: false) double? absBaroPressure,
      @JsonKey(includeIfNull: false) double? manifoldPressureKpa});
}

/// @nodoc
class _$CreateVehicleStatusDtoCopyWithImpl<$Res,
        $Val extends CreateVehicleStatusDto>
    implements $CreateVehicleStatusDtoCopyWith<$Res> {
  _$CreateVehicleStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? vin = freezed,
    Object? milOn = freezed,
    Object? kmMILOn = freezed,
    Object? minutesMILOn = freezed,
    Object? milCodes = freezed,
    Object? coolantTemperature = freezed,
    Object? maf = freezed,
    Object? oilTemperature = freezed,
    Object? intakeAirTemperature = freezed,
    Object? fuelPressure = freezed,
    Object? absBaroPressure = freezed,
    Object? manifoldPressureKpa = freezed,
  }) {
    return _then(_value.copyWith(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      milOn: freezed == milOn
          ? _value.milOn
          : milOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      kmMILOn: freezed == kmMILOn
          ? _value.kmMILOn
          : kmMILOn // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesMILOn: freezed == minutesMILOn
          ? _value.minutesMILOn
          : minutesMILOn // ignore: cast_nullable_to_non_nullable
              as int?,
      milCodes: freezed == milCodes
          ? _value.milCodes
          : milCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coolantTemperature: freezed == coolantTemperature
          ? _value.coolantTemperature
          : coolantTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maf: freezed == maf
          ? _value.maf
          : maf // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateVehicleStatusDtoImplCopyWith<$Res>
    implements $CreateVehicleStatusDtoCopyWith<$Res> {
  factory _$$CreateVehicleStatusDtoImplCopyWith(
          _$CreateVehicleStatusDtoImpl value,
          $Res Function(_$CreateVehicleStatusDtoImpl) then) =
      __$$CreateVehicleStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vehicle,
      @JsonKey(includeIfNull: false) String? vin,
      @JsonKey(includeIfNull: false) bool? milOn,
      @JsonKey(includeIfNull: false) int? kmMILOn,
      @JsonKey(includeIfNull: false) int? minutesMILOn,
      @JsonKey(defaultValue: []) List<String>? milCodes,
      @JsonKey(includeIfNull: false) double? coolantTemperature,
      @JsonKey(includeIfNull: false) double? maf,
      @JsonKey(includeIfNull: false) double? oilTemperature,
      @JsonKey(includeIfNull: false) double? intakeAirTemperature,
      @JsonKey(includeIfNull: false) double? fuelPressure,
      @JsonKey(includeIfNull: false) double? absBaroPressure,
      @JsonKey(includeIfNull: false) double? manifoldPressureKpa});
}

/// @nodoc
class __$$CreateVehicleStatusDtoImplCopyWithImpl<$Res>
    extends _$CreateVehicleStatusDtoCopyWithImpl<$Res,
        _$CreateVehicleStatusDtoImpl>
    implements _$$CreateVehicleStatusDtoImplCopyWith<$Res> {
  __$$CreateVehicleStatusDtoImplCopyWithImpl(
      _$CreateVehicleStatusDtoImpl _value,
      $Res Function(_$CreateVehicleStatusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? vin = freezed,
    Object? milOn = freezed,
    Object? kmMILOn = freezed,
    Object? minutesMILOn = freezed,
    Object? milCodes = freezed,
    Object? coolantTemperature = freezed,
    Object? maf = freezed,
    Object? oilTemperature = freezed,
    Object? intakeAirTemperature = freezed,
    Object? fuelPressure = freezed,
    Object? absBaroPressure = freezed,
    Object? manifoldPressureKpa = freezed,
  }) {
    return _then(_$CreateVehicleStatusDtoImpl(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      vin: freezed == vin
          ? _value.vin
          : vin // ignore: cast_nullable_to_non_nullable
              as String?,
      milOn: freezed == milOn
          ? _value.milOn
          : milOn // ignore: cast_nullable_to_non_nullable
              as bool?,
      kmMILOn: freezed == kmMILOn
          ? _value.kmMILOn
          : kmMILOn // ignore: cast_nullable_to_non_nullable
              as int?,
      minutesMILOn: freezed == minutesMILOn
          ? _value.minutesMILOn
          : minutesMILOn // ignore: cast_nullable_to_non_nullable
              as int?,
      milCodes: freezed == milCodes
          ? _value._milCodes
          : milCodes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coolantTemperature: freezed == coolantTemperature
          ? _value.coolantTemperature
          : coolantTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      maf: freezed == maf
          ? _value.maf
          : maf // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVehicleStatusDtoImpl implements _CreateVehicleStatusDto {
  const _$CreateVehicleStatusDtoImpl(
      {required this.vehicle,
      @JsonKey(includeIfNull: false) this.vin,
      @JsonKey(includeIfNull: false) this.milOn,
      @JsonKey(includeIfNull: false) this.kmMILOn,
      @JsonKey(includeIfNull: false) this.minutesMILOn,
      @JsonKey(defaultValue: []) final List<String>? milCodes,
      @JsonKey(includeIfNull: false) this.coolantTemperature,
      @JsonKey(includeIfNull: false) this.maf,
      @JsonKey(includeIfNull: false) this.oilTemperature,
      @JsonKey(includeIfNull: false) this.intakeAirTemperature,
      @JsonKey(includeIfNull: false) this.fuelPressure,
      @JsonKey(includeIfNull: false) this.absBaroPressure,
      @JsonKey(includeIfNull: false) this.manifoldPressureKpa})
      : _milCodes = milCodes;

  factory _$CreateVehicleStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateVehicleStatusDtoImplFromJson(json);

  @override
  final String vehicle;
  @override
  @JsonKey(includeIfNull: false)
  final String? vin;
  @override
  @JsonKey(includeIfNull: false)
  final bool? milOn;
  @override
  @JsonKey(includeIfNull: false)
  final int? kmMILOn;
  @override
  @JsonKey(includeIfNull: false)
  final int? minutesMILOn;
  final List<String>? _milCodes;
  @override
  @JsonKey(defaultValue: [])
  List<String>? get milCodes {
    final value = _milCodes;
    if (value == null) return null;
    if (_milCodes is EqualUnmodifiableListView) return _milCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  final double? coolantTemperature;
  @override
  @JsonKey(includeIfNull: false)
  final double? maf;
  @override
  @JsonKey(includeIfNull: false)
  final double? oilTemperature;
  @override
  @JsonKey(includeIfNull: false)
  final double? intakeAirTemperature;
  @override
  @JsonKey(includeIfNull: false)
  final double? fuelPressure;
  @override
  @JsonKey(includeIfNull: false)
  final double? absBaroPressure;
  @override
  @JsonKey(includeIfNull: false)
  final double? manifoldPressureKpa;

  @override
  String toString() {
    return 'CreateVehicleStatusDto(vehicle: $vehicle, vin: $vin, milOn: $milOn, kmMILOn: $kmMILOn, minutesMILOn: $minutesMILOn, milCodes: $milCodes, coolantTemperature: $coolantTemperature, maf: $maf, oilTemperature: $oilTemperature, intakeAirTemperature: $intakeAirTemperature, fuelPressure: $fuelPressure, absBaroPressure: $absBaroPressure, manifoldPressureKpa: $manifoldPressureKpa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVehicleStatusDtoImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.milOn, milOn) || other.milOn == milOn) &&
            (identical(other.kmMILOn, kmMILOn) || other.kmMILOn == kmMILOn) &&
            (identical(other.minutesMILOn, minutesMILOn) ||
                other.minutesMILOn == minutesMILOn) &&
            const DeepCollectionEquality().equals(other._milCodes, _milCodes) &&
            (identical(other.coolantTemperature, coolantTemperature) ||
                other.coolantTemperature == coolantTemperature) &&
            (identical(other.maf, maf) || other.maf == maf) &&
            (identical(other.oilTemperature, oilTemperature) ||
                other.oilTemperature == oilTemperature) &&
            (identical(other.intakeAirTemperature, intakeAirTemperature) ||
                other.intakeAirTemperature == intakeAirTemperature) &&
            (identical(other.fuelPressure, fuelPressure) ||
                other.fuelPressure == fuelPressure) &&
            (identical(other.absBaroPressure, absBaroPressure) ||
                other.absBaroPressure == absBaroPressure) &&
            (identical(other.manifoldPressureKpa, manifoldPressureKpa) ||
                other.manifoldPressureKpa == manifoldPressureKpa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      vehicle,
      vin,
      milOn,
      kmMILOn,
      minutesMILOn,
      const DeepCollectionEquality().hash(_milCodes),
      coolantTemperature,
      maf,
      oilTemperature,
      intakeAirTemperature,
      fuelPressure,
      absBaroPressure,
      manifoldPressureKpa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVehicleStatusDtoImplCopyWith<_$CreateVehicleStatusDtoImpl>
      get copyWith => __$$CreateVehicleStatusDtoImplCopyWithImpl<
          _$CreateVehicleStatusDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVehicleStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateVehicleStatusDto implements CreateVehicleStatusDto {
  const factory _CreateVehicleStatusDto(
          {required final String vehicle,
          @JsonKey(includeIfNull: false) final String? vin,
          @JsonKey(includeIfNull: false) final bool? milOn,
          @JsonKey(includeIfNull: false) final int? kmMILOn,
          @JsonKey(includeIfNull: false) final int? minutesMILOn,
          @JsonKey(defaultValue: []) final List<String>? milCodes,
          @JsonKey(includeIfNull: false) final double? coolantTemperature,
          @JsonKey(includeIfNull: false) final double? maf,
          @JsonKey(includeIfNull: false) final double? oilTemperature,
          @JsonKey(includeIfNull: false) final double? intakeAirTemperature,
          @JsonKey(includeIfNull: false) final double? fuelPressure,
          @JsonKey(includeIfNull: false) final double? absBaroPressure,
          @JsonKey(includeIfNull: false) final double? manifoldPressureKpa}) =
      _$CreateVehicleStatusDtoImpl;

  factory _CreateVehicleStatusDto.fromJson(Map<String, dynamic> json) =
      _$CreateVehicleStatusDtoImpl.fromJson;

  @override
  String get vehicle;
  @override
  @JsonKey(includeIfNull: false)
  String? get vin;
  @override
  @JsonKey(includeIfNull: false)
  bool? get milOn;
  @override
  @JsonKey(includeIfNull: false)
  int? get kmMILOn;
  @override
  @JsonKey(includeIfNull: false)
  int? get minutesMILOn;
  @override
  @JsonKey(defaultValue: [])
  List<String>? get milCodes;
  @override
  @JsonKey(includeIfNull: false)
  double? get coolantTemperature;
  @override
  @JsonKey(includeIfNull: false)
  double? get maf;
  @override
  @JsonKey(includeIfNull: false)
  double? get oilTemperature;
  @override
  @JsonKey(includeIfNull: false)
  double? get intakeAirTemperature;
  @override
  @JsonKey(includeIfNull: false)
  double? get fuelPressure;
  @override
  @JsonKey(includeIfNull: false)
  double? get absBaroPressure;
  @override
  @JsonKey(includeIfNull: false)
  double? get manifoldPressureKpa;
  @override
  @JsonKey(ignore: true)
  _$$CreateVehicleStatusDtoImplCopyWith<_$CreateVehicleStatusDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
