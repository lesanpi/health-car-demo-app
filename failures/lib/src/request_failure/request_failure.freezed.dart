// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestFailure _$RequestFailureFromJson(Map<String, dynamic> json) {
  return _RequestFailure.fromJson(json);
}

/// @nodoc
mixin _$RequestFailure {
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestFailureCopyWith<RequestFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFailureCopyWith<$Res> {
  factory $RequestFailureCopyWith(
          RequestFailure value, $Res Function(RequestFailure) then) =
      _$RequestFailureCopyWithImpl<$Res, RequestFailure>;
  @useResult
  $Res call({String message, int statusCode});
}

/// @nodoc
class _$RequestFailureCopyWithImpl<$Res, $Val extends RequestFailure>
    implements $RequestFailureCopyWith<$Res> {
  _$RequestFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestFailureImplCopyWith<$Res>
    implements $RequestFailureCopyWith<$Res> {
  factory _$$RequestFailureImplCopyWith(_$RequestFailureImpl value,
          $Res Function(_$RequestFailureImpl) then) =
      __$$RequestFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode});
}

/// @nodoc
class __$$RequestFailureImplCopyWithImpl<$Res>
    extends _$RequestFailureCopyWithImpl<$Res, _$RequestFailureImpl>
    implements _$$RequestFailureImplCopyWith<$Res> {
  __$$RequestFailureImplCopyWithImpl(
      _$RequestFailureImpl _value, $Res Function(_$RequestFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
  }) {
    return _then(_$RequestFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestFailureImpl implements _RequestFailure {
  const _$RequestFailureImpl(
      {required this.message, this.statusCode = HttpStatus.badRequest});

  factory _$RequestFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestFailureImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey()
  final int statusCode;

  @override
  String toString() {
    return 'RequestFailure(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestFailureImplCopyWith<_$RequestFailureImpl> get copyWith =>
      __$$RequestFailureImplCopyWithImpl<_$RequestFailureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestFailureImplToJson(
      this,
    );
  }
}

abstract class _RequestFailure implements RequestFailure {
  const factory _RequestFailure(
      {required final String message,
      final int statusCode}) = _$RequestFailureImpl;

  factory _RequestFailure.fromJson(Map<String, dynamic> json) =
      _$RequestFailureImpl.fromJson;

  @override
  String get message;
  @override
  int get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$RequestFailureImplCopyWith<_$RequestFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
