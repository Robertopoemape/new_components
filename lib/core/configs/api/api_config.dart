import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:jc_module/core/configs/router/router_provider_micro.gr.dart';
import 'package:jc_module/core/configs/services/secure_storage_service.dart';
import 'package:jc_module/jc_module.dart';
import 'package:jc_module/main.dart';

enum EnvBaseUrl {
  baseUrl,
  baseUrlEndPoint,
  baseUrlTicketing,
  baseUrlCheckOut,
  baseUrlS3,
}

class Api {
  factory Api.ctrlQr() {
    _headerDefault = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-joinnus-mobile': Env.xJoinnusMobileEntryCtrl,
    };
    return _instance;
  }

  factory Api.cashless() {
    _headerDefault = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-joinnus-mobile': Env.xJoinnusMobileCashless,
    };
    return _instance;
  }

  Api._internal();
  static final Api _instance = Api._internal();
  static Map<String, String>? _headerDefault;

  Dio get dio => _createDio(
        EnvironmentManager.baseUrl,
        EnvBaseUrl.baseUrl,
      );

  Dio get dioCashless => _createDio(
        EnvironmentManager.baseUrlCashless,
        EnvBaseUrl.baseUrlEndPoint,
      );

  Dio get dioCheckOut => _createDio(
        EnvironmentManager.baseUrlCheckOut,
        EnvBaseUrl.baseUrlCheckOut,
      );

  Dio get dioS3 => _createDio(
        EnvironmentManager.baseUrlS3,
        EnvBaseUrl.baseUrlS3,
      );

  // Método privado para crear una instancia de Dio según el endpoint.
  Dio _createDio(String baseUrl, EnvBaseUrl envBaseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        headers: _headerDefault,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
      ),
    )..interceptors.addAll([
        SessionInterceptor(),
        AwesomeDioInterceptor(
          logRequestTimeout: false,
        ),
      ]);
  }
}

class SessionInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains('api/v1/app/oauth/login')) {
      handler.next(options);
      return;
    }

    final token = await SecureStorageService().getToken();
    final isSessionValid = await SecureStorageService().isSessionValid();
    if (isSessionValid) {
      if (token != '' && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        if (options.path.contains('api/v1/reservate') ||
            options.path.contains('api/v1/code/transfer')) {
          options.headers['captcha-config'] = false;
        }
      }
      handler.next(options);
    } else {
      await SecureStorageService().deleteUserInfo();
      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.badCertificate,
          error: 'Sesión no válida, redirigiendo al login',
        ),
      );
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !err.requestOptions.extra.containsKey('retry')) {
      try {
        err.requestOptions.extra['retry'] = true;

        final userInfo = await SecureStorageService().getUserInfo();
        final refreshToken = await SecureStorageService().tokenRefresh();

        if (refreshToken.isNotEmpty) {
          final tokenData = await AuthenticationRemoteServiceImpl()
              .getRefreshToken(refreshToken: refreshToken);

          final userTokenFinal = userInfo!.copyWith(
            token: userInfo.token!.copyWith(
              accessToken: tokenData.accessToken,
              refreshToken: tokenData.refreshToken,
            ),
          );
          await SecureStorageService().deleteUserInfo();
          await SecureStorageService().saveUserInfo(userTokenFinal);

          final newToken = tokenData.accessToken;
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';

          final newRequest = await Dio().fetch(err.requestOptions);
          return handler.resolve(newRequest);
        } else {
          await SecureStorageService().deleteUserInfo();
          _navigateToLogin();
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              type: DioExceptionType.cancel,
              error: 'Sesión no válida, redirigiendo al login',
            ),
          );
        }
      } catch (e) {
        await SecureStorageService().deleteUserInfo();
        _navigateToLogin();
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            type: DioExceptionType.cancel,
            error: 'Sesión no válida, redirigiendo al login',
          ),
        );
      }
    }

    handler.next(err);
  }

  void _navigateToLogin() {
    appRouter.replaceAll([
      AuthenticationScreenRoute(),
    ]);
  }
}
