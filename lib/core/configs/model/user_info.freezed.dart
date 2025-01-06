// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  UserData? get data => throw _privateConstructorUsedError;
  TokenData? get token => throw _privateConstructorUsedError;
  DateTime? get expiredAt => throw _privateConstructorUsedError;
  DateTime? get expiredSessionAt => throw _privateConstructorUsedError;
  String? get session => throw _privateConstructorUsedError;
  int? get sessionExpiresIn => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {UserData? data,
      TokenData? token,
      DateTime? expiredAt,
      DateTime? expiredSessionAt,
      String? session,
      int? sessionExpiresIn,
      String? message,
      String? state,
      int? code});

  $UserDataCopyWith<$Res>? get data;
  $TokenDataCopyWith<$Res>? get token;
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? token = freezed,
    Object? expiredAt = freezed,
    Object? expiredSessionAt = freezed,
    Object? session = freezed,
    Object? sessionExpiresIn = freezed,
    Object? message = freezed,
    Object? state = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserData?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenData?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredSessionAt: freezed == expiredSessionAt
          ? _value.expiredSessionAt
          : expiredSessionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionExpiresIn: freezed == sessionExpiresIn
          ? _value.sessionExpiresIn
          : sessionExpiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenDataCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenDataCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? data,
      TokenData? token,
      DateTime? expiredAt,
      DateTime? expiredSessionAt,
      String? session,
      int? sessionExpiresIn,
      String? message,
      String? state,
      int? code});

  @override
  $UserDataCopyWith<$Res>? get data;
  @override
  $TokenDataCopyWith<$Res>? get token;
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? token = freezed,
    Object? expiredAt = freezed,
    Object? expiredSessionAt = freezed,
    Object? session = freezed,
    Object? sessionExpiresIn = freezed,
    Object? message = freezed,
    Object? state = freezed,
    Object? code = freezed,
  }) {
    return _then(_$UserInfoImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserData?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenData?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredSessionAt: freezed == expiredSessionAt
          ? _value.expiredSessionAt
          : expiredSessionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionExpiresIn: freezed == sessionExpiresIn
          ? _value.sessionExpiresIn
          : sessionExpiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {this.data,
      this.token,
      this.expiredAt,
      this.expiredSessionAt,
      this.session,
      this.sessionExpiresIn,
      this.message,
      this.state,
      this.code});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final UserData? data;
  @override
  final TokenData? token;
  @override
  final DateTime? expiredAt;
  @override
  final DateTime? expiredSessionAt;
  @override
  final String? session;
  @override
  final int? sessionExpiresIn;
  @override
  final String? message;
  @override
  final String? state;
  @override
  final int? code;

  @override
  String toString() {
    return 'UserInfo(data: $data, token: $token, expiredAt: $expiredAt, expiredSessionAt: $expiredSessionAt, session: $session, sessionExpiresIn: $sessionExpiresIn, message: $message, state: $state, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.expiredSessionAt, expiredSessionAt) ||
                other.expiredSessionAt == expiredSessionAt) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.sessionExpiresIn, sessionExpiresIn) ||
                other.sessionExpiresIn == sessionExpiresIn) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, token, expiredAt,
      expiredSessionAt, session, sessionExpiresIn, message, state, code);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {final UserData? data,
      final TokenData? token,
      final DateTime? expiredAt,
      final DateTime? expiredSessionAt,
      final String? session,
      final int? sessionExpiresIn,
      final String? message,
      final String? state,
      final int? code}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  UserData? get data;
  @override
  TokenData? get token;
  @override
  DateTime? get expiredAt;
  @override
  DateTime? get expiredSessionAt;
  @override
  String? get session;
  @override
  int? get sessionExpiresIn;
  @override
  String? get message;
  @override
  String? get state;
  @override
  int? get code;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
