import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jc_module/core/configs/model/token_data.dart';
import 'package:jc_module/core/configs/model/user_data.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
  )
  const factory UserInfo({
    UserData? data,
    TokenData? token,
    DateTime? expiredAt,
    DateTime? expiredSessionAt,
    String? session,
    int? sessionExpiresIn,
    String? message,
    String? state,
    int? code,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
