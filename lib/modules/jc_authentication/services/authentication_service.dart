import 'package:jc_module/core/configs/services/secure_storage_service.dart';
import 'package:jc_module/jc_module.dart';

abstract class AuthenticationRemoteService {
  Future<UserInfo> login({required String username, required String password});
  Future<TokenData> getRefreshToken({required String refreshToken});
  Future<void> logout();
}

class AuthenticationRemoteServiceImpl implements AuthenticationRemoteService {
  @override
  Future<UserInfo> login({
    required String username,
    required String password,
  }) async {
    try {
      Response<dynamic> result;
      result = await Api.ctrlQr().dio.postDecorator(
        'api/v1/app/oauth/login',
        data: <String, dynamic>{
          'username': username,
          'password': password,
        },
      );
      return UserInfo.fromJson(result.data as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<TokenData> getRefreshToken({required String refreshToken}) async {
    try {
      Response<dynamic> result;
      result = await Api.ctrlQr().dio.postDecorator(
        'api/v1/app/oauth/refresh',
        data: <String, dynamic>{
          'refresh_token': refreshToken,
        },
      );
      return TokenData.fromJson(result.data as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await SecureStorageService().deleteUserInfo();
    } on Exception {
      rethrow;
    }
  }
}
