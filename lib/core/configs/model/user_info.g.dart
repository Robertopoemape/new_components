// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] == null
          ? null
          : TokenData.fromJson(json['token'] as Map<String, dynamic>),
      expiredAt: json['expired_at'] == null
          ? null
          : DateTime.parse(json['expired_at'] as String),
      expiredSessionAt: json['expired_session_at'] == null
          ? null
          : DateTime.parse(json['expired_session_at'] as String),
      session: json['session'] as String?,
      sessionExpiresIn: (json['session_expires_in'] as num?)?.toInt(),
      message: json['message'] as String?,
      state: json['state'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'token': instance.token?.toJson(),
      'expired_at': instance.expiredAt?.toIso8601String(),
      'expired_session_at': instance.expiredSessionAt?.toIso8601String(),
      'session': instance.session,
      'session_expires_in': instance.sessionExpiresIn,
      'message': instance.message,
      'state': instance.state,
      'code': instance.code,
    };
