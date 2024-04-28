// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_vehicle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVehicleDto _$CreateVehicleDtoFromJson(Map<String, dynamic> json) {
  return _CreateVehicleDto.fromJson(json);
}

/// @nodoc
mixin _$CreateVehicleDto {
  String get name => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateVehicleDtoCopyWith<CreateVehicleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVehicleDtoCopyWith<$Res> {
  factory $CreateVehicleDtoCopyWith(
          CreateVehicleDto value, $Res Function(CreateVehicleDto) then) =
      _$CreateVehicleDtoCopyWithImpl<$Res, CreateVehicleDto>;
  @useResult
  $Res call({String name, String photo});
}

/// @nodoc
class _$CreateVehicleDtoCopyWithImpl<$Res, $Val extends CreateVehicleDto>
    implements $CreateVehicleDtoCopyWith<$Res> {
  _$CreateVehicleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateVehicleDtoImplCopyWith<$Res>
    implements $CreateVehicleDtoCopyWith<$Res> {
  factory _$$CreateVehicleDtoImplCopyWith(_$CreateVehicleDtoImpl value,
          $Res Function(_$CreateVehicleDtoImpl) then) =
      __$$CreateVehicleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String photo});
}

/// @nodoc
class __$$CreateVehicleDtoImplCopyWithImpl<$Res>
    extends _$CreateVehicleDtoCopyWithImpl<$Res, _$CreateVehicleDtoImpl>
    implements _$$CreateVehicleDtoImplCopyWith<$Res> {
  __$$CreateVehicleDtoImplCopyWithImpl(_$CreateVehicleDtoImpl _value,
      $Res Function(_$CreateVehicleDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? photo = null,
  }) {
    return _then(_$CreateVehicleDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVehicleDtoImpl implements _CreateVehicleDto {
  const _$CreateVehicleDtoImpl({required this.name, required this.photo});

  factory _$CreateVehicleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateVehicleDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String photo;

  @override
  String toString() {
    return 'CreateVehicleDto(name: $name, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVehicleDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVehicleDtoImplCopyWith<_$CreateVehicleDtoImpl> get copyWith =>
      __$$CreateVehicleDtoImplCopyWithImpl<_$CreateVehicleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVehicleDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateVehicleDto implements CreateVehicleDto {
  const factory _CreateVehicleDto(
      {required final String name,
      required final String photo}) = _$CreateVehicleDtoImpl;

  factory _CreateVehicleDto.fromJson(Map<String, dynamic> json) =
      _$CreateVehicleDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$CreateVehicleDtoImplCopyWith<_$CreateVehicleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
