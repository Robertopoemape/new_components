// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorObject {
  String get title => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;

  /// Create a copy of ErrorObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorObjectCopyWith<ErrorObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorObjectCopyWith<$Res> {
  factory $ErrorObjectCopyWith(
          ErrorObject value, $Res Function(ErrorObject) then) =
      _$ErrorObjectCopyWithImpl<$Res, ErrorObject>;
  @useResult
  $Res call({String title, int statusCode, String message, dynamic error});
}

/// @nodoc
class _$ErrorObjectCopyWithImpl<$Res, $Val extends ErrorObject>
    implements $ErrorObjectCopyWith<$Res> {
  _$ErrorObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? statusCode = null,
    Object? message = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorObjectImplCopyWith<$Res>
    implements $ErrorObjectCopyWith<$Res> {
  factory _$$ErrorObjectImplCopyWith(
          _$ErrorObjectImpl value, $Res Function(_$ErrorObjectImpl) then) =
      __$$ErrorObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int statusCode, String message, dynamic error});
}

/// @nodoc
class __$$ErrorObjectImplCopyWithImpl<$Res>
    extends _$ErrorObjectCopyWithImpl<$Res, _$ErrorObjectImpl>
    implements _$$ErrorObjectImplCopyWith<$Res> {
  __$$ErrorObjectImplCopyWithImpl(
      _$ErrorObjectImpl _value, $Res Function(_$ErrorObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? statusCode = null,
    Object? message = null,
    Object? error = freezed,
  }) {
    return _then(_$ErrorObjectImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ErrorObjectImpl implements _ErrorObject {
  const _$ErrorObjectImpl(
      {required this.title,
      required this.statusCode,
      required this.message,
      required this.error});

  @override
  final String title;
  @override
  final int statusCode;
  @override
  final String message;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'ErrorObject(title: $title, statusCode: $statusCode, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorObjectImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, statusCode, message,
      const DeepCollectionEquality().hash(error));

  /// Create a copy of ErrorObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorObjectImplCopyWith<_$ErrorObjectImpl> get copyWith =>
      __$$ErrorObjectImplCopyWithImpl<_$ErrorObjectImpl>(this, _$identity);
}

abstract class _ErrorObject implements ErrorObject {
  const factory _ErrorObject(
      {required final String title,
      required final int statusCode,
      required final String message,
      required final dynamic error}) = _$ErrorObjectImpl;

  @override
  String get title;
  @override
  int get statusCode;
  @override
  String get message;
  @override
  dynamic get error;

  /// Create a copy of ErrorObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorObjectImplCopyWith<_$ErrorObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
