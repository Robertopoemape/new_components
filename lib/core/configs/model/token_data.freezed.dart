// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenData _$TokenDataFromJson(Map<String, dynamic> json) {
  return _TokenData.fromJson(json);
}

/// @nodoc
mixin _$TokenData {
  String? get accessToken => throw _privateConstructorUsedError;
  int? get expiresIn => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;

  /// Serializes this TokenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenDataCopyWith<TokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDataCopyWith<$Res> {
  factory $TokenDataCopyWith(TokenData value, $Res Function(TokenData) then) =
      _$TokenDataCopyWithImpl<$Res, TokenData>;
  @useResult
  $Res call(
      {String? accessToken,
      int? expiresIn,
      String? refreshToken,
      String? tokenType});
}

/// @nodoc
class _$TokenDataCopyWithImpl<$Res, $Val extends TokenData>
    implements $TokenDataCopyWith<$Res> {
  _$TokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDataImplCopyWith<$Res>
    implements $TokenDataCopyWith<$Res> {
  factory _$$TokenDataImplCopyWith(
          _$TokenDataImpl value, $Res Function(_$TokenDataImpl) then) =
      __$$TokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accessToken,
      int? expiresIn,
      String? refreshToken,
      String? tokenType});
}

/// @nodoc
class __$$TokenDataImplCopyWithImpl<$Res>
    extends _$TokenDataCopyWithImpl<$Res, _$TokenDataImpl>
    implements _$$TokenDataImplCopyWith<$Res> {
  __$$TokenDataImplCopyWithImpl(
      _$TokenDataImpl _value, $Res Function(_$TokenDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? tokenType = freezed,
  }) {
    return _then(_$TokenDataImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$TokenDataImpl implements _TokenData {
  const _$TokenDataImpl(
      {this.accessToken, this.expiresIn, this.refreshToken, this.tokenType});

  factory _$TokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenDataImplFromJson(json);

  @override
  final String? accessToken;
  @override
  final int? expiresIn;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;

  @override
  String toString() {
    return 'TokenData(accessToken: $accessToken, expiresIn: $expiresIn, refreshToken: $refreshToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, expiresIn, refreshToken, tokenType);

  /// Create a copy of TokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDataImplCopyWith<_$TokenDataImpl> get copyWith =>
      __$$TokenDataImplCopyWithImpl<_$TokenDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenDataImplToJson(
      this,
    );
  }
}

abstract class _TokenData implements TokenData {
  const factory _TokenData(
      {final String? accessToken,
      final int? expiresIn,
      final String? refreshToken,
      final String? tokenType}) = _$TokenDataImpl;

  factory _TokenData.fromJson(Map<String, dynamic> json) =
      _$TokenDataImpl.fromJson;

  @override
  String? get accessToken;
  @override
  int? get expiresIn;
  @override
  String? get refreshToken;
  @override
  String? get tokenType;

  /// Create a copy of TokenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenDataImplCopyWith<_$TokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
