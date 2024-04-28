// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReportDto _$CreateReportDtoFromJson(Map<String, dynamic> json) {
  return _CreateReportDto.fromJson(json);
}

/// @nodoc
mixin _$CreateReportDto {
  String get vehicle => throw _privateConstructorUsedError;
  int get mileage => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;
  Geolocation? get geolocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReportDtoCopyWith<CreateReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReportDtoCopyWith<$Res> {
  factory $CreateReportDtoCopyWith(
          CreateReportDto value, $Res Function(CreateReportDto) then) =
      _$CreateReportDtoCopyWithImpl<$Res, CreateReportDto>;
  @useResult
  $Res call(
      {String vehicle,
      int mileage,
      String channel,
      String device,
      Geolocation? geolocation});

  $GeolocationCopyWith<$Res>? get geolocation;
}

/// @nodoc
class _$CreateReportDtoCopyWithImpl<$Res, $Val extends CreateReportDto>
    implements $CreateReportDtoCopyWith<$Res> {
  _$CreateReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? mileage = null,
    Object? channel = null,
    Object? device = null,
    Object? geolocation = freezed,
  }) {
    return _then(_value.copyWith(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeolocationCopyWith<$Res>? get geolocation {
    if (_value.geolocation == null) {
      return null;
    }

    return $GeolocationCopyWith<$Res>(_value.geolocation!, (value) {
      return _then(_value.copyWith(geolocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateReportDtoImplCopyWith<$Res>
    implements $CreateReportDtoCopyWith<$Res> {
  factory _$$CreateReportDtoImplCopyWith(_$CreateReportDtoImpl value,
          $Res Function(_$CreateReportDtoImpl) then) =
      __$$CreateReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vehicle,
      int mileage,
      String channel,
      String device,
      Geolocation? geolocation});

  @override
  $GeolocationCopyWith<$Res>? get geolocation;
}

/// @nodoc
class __$$CreateReportDtoImplCopyWithImpl<$Res>
    extends _$CreateReportDtoCopyWithImpl<$Res, _$CreateReportDtoImpl>
    implements _$$CreateReportDtoImplCopyWith<$Res> {
  __$$CreateReportDtoImplCopyWithImpl(
      _$CreateReportDtoImpl _value, $Res Function(_$CreateReportDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicle = null,
    Object? mileage = null,
    Object? channel = null,
    Object? device = null,
    Object? geolocation = freezed,
  }) {
    return _then(_$CreateReportDtoImpl(
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      mileage: null == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReportDtoImpl implements _CreateReportDto {
  const _$CreateReportDtoImpl(
      {required this.vehicle,
      required this.mileage,
      this.channel = '',
      this.device = '',
      this.geolocation});

  factory _$CreateReportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReportDtoImplFromJson(json);

  @override
  final String vehicle;
  @override
  final int mileage;
  @override
  @JsonKey()
  final String channel;
  @override
  @JsonKey()
  final String device;
  @override
  final Geolocation? geolocation;

  @override
  String toString() {
    return 'CreateReportDto(vehicle: $vehicle, mileage: $mileage, channel: $channel, device: $device, geolocation: $geolocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReportDtoImpl &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vehicle, mileage, channel, device, geolocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      __$$CreateReportDtoImplCopyWithImpl<_$CreateReportDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReportDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateReportDto implements CreateReportDto {
  const factory _CreateReportDto(
      {required final String vehicle,
      required final int mileage,
      final String channel,
      final String device,
      final Geolocation? geolocation}) = _$CreateReportDtoImpl;

  factory _CreateReportDto.fromJson(Map<String, dynamic> json) =
      _$CreateReportDtoImpl.fromJson;

  @override
  String get vehicle;
  @override
  int get mileage;
  @override
  String get channel;
  @override
  String get device;
  @override
  Geolocation? get geolocation;
  @override
  @JsonKey(ignore: true)
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
