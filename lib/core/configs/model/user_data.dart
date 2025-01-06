import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  @JsonSerializable(
    fieldRename: FieldRename.none,
    explicitToJson: true,
  )
  const factory UserData({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? fullName,
    String? dniUser,
    List<String>? roles,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
