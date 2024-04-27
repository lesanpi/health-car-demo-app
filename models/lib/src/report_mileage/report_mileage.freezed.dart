// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_mileage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportMileage _$ReportMileageFromJson(Map<String, dynamic> json) {
  return _ReportMileage.fromJson(json);
}

/// @nodoc
mixin _$ReportMileage {
  String get id => throw _privateConstructorUsedError;
  String get vehicle => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  Geolocation? get geolocation => throw _privateConstructorUsedError;
  int get mileage => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportMileageCopyWith<ReportMileage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportMileageCopyWith<$Res> {
  factory $ReportMileageCopyWith(
          ReportMileage value, $Res Function(ReportMileage) then) =
      _$ReportMileageCopyWithImpl<$Res, ReportMileage>;
  @useResult
  $Res call(
      {String id,
      String vehicle,
      @DateTimeConverter() DateTime createdAt,
      Geolocation? geolocation,
      int mileage,
      String channel,
      String device});

  $GeolocationCopyWith<$Res>? get geolocation;
}

/// @nodoc
class _$ReportMileageCopyWithImpl<$Res, $Val extends ReportMileage>
    implements $ReportMileageCopyWith<$Res> {
  _$ReportMileageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? createdAt = null,
    Object? geolocation = freezed,
    Object? mileage = null,
    Object? channel = null,
    Object? device = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation?,
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
abstract class _$$ReportMileageImplCopyWith<$Res>
    implements $ReportMileageCopyWith<$Res> {
  factory _$$ReportMileageImplCopyWith(
          _$ReportMileageImpl value, $Res Function(_$ReportMileageImpl) then) =
      __$$ReportMileageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vehicle,
      @DateTimeConverter() DateTime createdAt,
      Geolocation? geolocation,
      int mileage,
      String channel,
      String device});

  @override
  $GeolocationCopyWith<$Res>? get geolocation;
}

/// @nodoc
class __$$ReportMileageImplCopyWithImpl<$Res>
    extends _$ReportMileageCopyWithImpl<$Res, _$ReportMileageImpl>
    implements _$$ReportMileageImplCopyWith<$Res> {
  __$$ReportMileageImplCopyWithImpl(
      _$ReportMileageImpl _value, $Res Function(_$ReportMileageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicle = null,
    Object? createdAt = null,
    Object? geolocation = freezed,
    Object? mileage = null,
    Object? channel = null,
    Object? device = null,
  }) {
    return _then(_$ReportMileageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportMileageImpl implements _ReportMileage {
  const _$ReportMileageImpl(
      {required this.id,
      required this.vehicle,
      @DateTimeConverter() required this.createdAt,
      this.geolocation,
      this.mileage = 0,
      this.channel = '',
      this.device = ''});

  factory _$ReportMileageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportMileageImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicle;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  final Geolocation? geolocation;
  @override
  @JsonKey()
  final int mileage;
  @override
  @JsonKey()
  final String channel;
  @override
  @JsonKey()
  final String device;

  @override
  String toString() {
    return 'ReportMileage(id: $id, vehicle: $vehicle, createdAt: $createdAt, geolocation: $geolocation, mileage: $mileage, channel: $channel, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportMileageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, vehicle, createdAt,
      geolocation, mileage, channel, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportMileageImplCopyWith<_$ReportMileageImpl> get copyWith =>
      __$$ReportMileageImplCopyWithImpl<_$ReportMileageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportMileageImplToJson(
      this,
    );
  }
}

abstract class _ReportMileage implements ReportMileage {
  const factory _ReportMileage(
      {required final String id,
      required final String vehicle,
      @DateTimeConverter() required final DateTime createdAt,
      final Geolocation? geolocation,
      final int mileage,
      final String channel,
      final String device}) = _$ReportMileageImpl;

  factory _ReportMileage.fromJson(Map<String, dynamic> json) =
      _$ReportMileageImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicle;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  Geolocation? get geolocation;
  @override
  int get mileage;
  @override
  String get channel;
  @override
  String get device;
  @override
  @JsonKey(ignore: true)
  _$$ReportMileageImplCopyWith<_$ReportMileageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
