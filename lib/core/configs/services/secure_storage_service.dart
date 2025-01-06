import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jc_module/core/configs/model/model.dart';

class SecureStorageService {
  factory SecureStorageService() {
    return _instance;
  }

  SecureStorageService._internal();
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.passcode,
    ),
  );

  UserInfo? _cachedUserInfo;
  UserInfo? get cachedUserInfo => _cachedUserInfo;

  Future<int?> getReimaingTimeSession() async {
    if (_cachedUserInfo == null) {
      final userInfo = await getUserInfo();
      if (userInfo != null) {
        _cachedUserInfo = userInfo;
      } else {
        return 0;
      }
    }
    final remainingTime =
        _cachedUserInfo!.expiredSessionAt!.difference(DateTime.now()).inSeconds;

    return remainingTime;
  }

  Future<void> saveUserInfo(UserInfo userInfo) async {
    final expiredAt =
        DateTime.now().add(Duration(seconds: userInfo.token!.expiresIn!));

    final expiredSessionAt =
        DateTime.now().add(Duration(seconds: userInfo.sessionExpiresIn ?? 0));

    final userInfoUpdateExpiredAt = userInfo.copyWith(
      expiredAt: expiredAt,
      expiredSessionAt: expiredSessionAt,
    );
    final userInfoJson = jsonEncode(userInfoUpdateExpiredAt.toJson());
    await _secureStorage.write(key: 'user_info', value: userInfoJson);
    _cachedUserInfo = userInfoUpdateExpiredAt;
  }

  Future<String> getToken() async {
    final userInfo = await getUserInfo();
    return userInfo?.token?.accessToken ?? '';
  }

  Future<DateTime> getSessionExpireAt() async {
    final userInfo = await getUserInfo();
    return userInfo?.expiredSessionAt ?? DateTime.now();
  }

  Future<UserInfo?> getUserInfo() async {
    if (_cachedUserInfo != null) {
      return _cachedUserInfo;
    }

    final userJson = await _secureStorage.read(key: 'user_info');
    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      _cachedUserInfo = UserInfo.fromJson(userMap);
      return UserInfo.fromJson(userMap);
    }
    return null;
  }

  Future<bool> isSessionValid() async {
    final userInfo = await getUserInfo();
    log('userInfo: $userInfo');
    if (userInfo != null) {
      if (userInfo.token != null) {
        final expiredAt = userInfo.expiredAt;
        final now = DateTime.now();
        if (expiredAt != null && expiredAt.isAfter(now)) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> deleteUserInfo() async {
    await _secureStorage.delete(key: 'user_info');
    _cachedUserInfo = null;
  }

  Future<String> tokenRefresh() async {
    final userInfo = await getUserInfo();
    return userInfo?.token?.refreshToken ?? '';
  }
}
