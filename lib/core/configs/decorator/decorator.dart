import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jc_module/core/configs/exceptions/exceptions.dart';

/// Decorator function to handle asynchronous operations and convert exceptions to `Failure`.
Future<Either<Failure, T>> futureDecorator<T>(
  Future<T> Function() callback,
) async {
  try {
    final result = await callback();
    return Either<Failure, T>.right(result);
  } on CException catch (e) {
    return Either<Failure, T>.left(_mapCExceptionToFailure(e));
  }
}

/// Maps `CException` to corresponding `Failure`.
Failure _mapCExceptionToFailure(CException exception) {
  return exception.when(
    cacheException: (statusCode, message, _, error, ___) => CacheFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    conflictException: (statusCode, message, _, error, ___) => ConflictFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    connectTimeOutException: (statusCode, message, _, error, ___) =>
        ConnectionTimeoutFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    parametersException: (statusCode, message, _, error, ___) =>
        ErrorParametersFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    internalServerErrorException: (statusCode, message, _, error, ___) =>
        InternalServerErrorFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    invalidCredentialsException: (statusCode, message, _, error, ___) =>
        InvalidCredentialFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    localException: (statusCode, message, _, error, ___) => LocalFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    networkConnectionException: (statusCode, message, _, error, ___) =>
        NetworkConnectionFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    notFoundException: (statusCode, message, _, error, ___) => NotFoundFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    othersException: (statusCode, message, _, error, ___) => OthersFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    parserErrorException: (statusCode, message, _, error, ___) =>
        ParserErrorFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    requestTimeOutException: (statusCode, message, _, error, ___) =>
        RequestTimeOutFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    serverCancelException: (statusCode, message, _, error, ___) =>
        ServerCancelFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    serverSocketException: (statusCode, message, _, error, ___) =>
        ServerSocketFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    serviceUnAvailableException: (statusCode, message, _, error, ___) =>
        ServiceUnAvailableFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    sessionExpiredException: (statusCode, message, _, error, ___) =>
        SessionExpiredFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    sessionNotFoundException: (statusCode, message, _, error, ___) =>
        SessionNotFoundFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    undefinedException: (statusCode, message, _, error, ___) =>
        UndefinedFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    undefinedOrUrlNotExistException: (statusCode, message, _, error, ___) =>
        UndefinedOrUrlNotExistFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    registerInvalidException: (statusCode, message, _, error, ___) =>
        RegisterInvalidFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    emptyDataException: (statusCode, message, _, error, ___) =>
        EmptyDataFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
    businessErrorException: (statusCode, message, _, error, ___) =>
        BusinessErrorFailure(
      statusCode: statusCode,
      message: message,
      error: error,
    ),
  );
}

extension ApiDecorator on Dio {
  Future<Response<dynamic>> _requestDecorator(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      String errorMessage;
      dynamic errors;
      final result = await request();

      if (result.statusCode == 200 ||
          result.statusCode == 204 ||
          result.statusCode == 201) {
        if (result.data != null && result.data['state'] == 'error') {
          errors = result.data['errors'] ?? '';
          if (errors is List && errors.isNotEmpty) {
            errorMessage = errors[0].toString();
          } else if (errors is String) {
            errorMessage = errors;
          } else {
            errorMessage = 'Unknown error';
          }
          throw mapStatusCodeToException(
            result.statusCode ?? 500,
            result.data['message'] as String?,
            errorMessage,
          );
        }

        return result;
      } else {
        errors = result.data['errors'] ?? '';
        if (errors is List && errors.isNotEmpty) {
          errorMessage = errors[0].toString();
        } else if (errors is String) {
          errorMessage = errors;
        } else {
          errorMessage = 'Unknown error';
        }
        final message = result.data['message'] as String?;
        throw mapStatusCodeToException(
          result.statusCode ?? 500,
          message,
          errorMessage,
        );
      }
    } on DioException catch (dioError) {
      throw mapDioExceptionToException(dioError);
    }
  }

  Future<Response<dynamic>> downloadDecorator(
    String path,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => download(
        path,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<dynamic>> getDecorator(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<dynamic>> postDecorator(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<dynamic>> putDecorator(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<dynamic>> patchDecorator(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<dynamic>> deleteDecorator(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _requestDecorator(
      () => delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  /// Maps HTTP status code to corresponding exception.
  Exception mapStatusCodeToException(
    int statusCode,
    String? message,
    dynamic error,
  ) {
    switch (statusCode) {
      case 200:
        return InvalidCredentialsException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 400:
        return InvalidCredentialsException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 401:
        return InvalidCredentialsException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 403:
        return InvalidCredentialsException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 404:
        return NotFoundException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 409:
        return ConflictException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 408:
        return RequestTimeOutException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 422:
        return BusinessErrorException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 500:
        return InternalServerErrorException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      case 503:
      case 504:
        return ServiceUnAvailableException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
      default:
        return UndefinedOrUrlNotExistException(
          statusCode: statusCode,
          message: message,
          error: error,
        );
    }
  }

  /// Maps `DioException` to corresponding exception.
  Exception mapDioExceptionToException(DioException dioError) {
    final dynamic errors = dioError.response?.data['errors'];

    String errorMessage;
    if (errors is List && errors.isNotEmpty) {
      errorMessage = errors[0].toString();
    } else if (errors is String) {
      errorMessage = errors;
    } else {
      errorMessage = 'Unknown error';
    }
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkConnectionException(
          statusCode: dioError.response?.statusCode ?? 408,
          error: errorMessage,
          message: 'Connection timeout',
        );
      case DioExceptionType.receiveTimeout:
        return ConnectTimeOutException(
          statusCode: dioError.response?.statusCode ?? 408,
          error: errorMessage,
          message: 'Receive timeout',
        );
      case DioExceptionType.cancel:
        return ServerCancelException(
          statusCode: dioError.response?.statusCode ?? 499,
          error: errorMessage,
          message: 'Request has been canceled',
        );
      case DioExceptionType.badResponse:
        return mapStatusCodeToException(
          dioError.response?.statusCode ?? 500,
          dioError.response?.data['message'] as String?,
          errorMessage,
        );
      case DioExceptionType.sendTimeout:
        return ServerSocketException(
          statusCode: dioError.response?.statusCode ?? 408,
          error: errorMessage,
          message: 'Send timeout',
        );
      case DioExceptionType.badCertificate:
        return SessionExpiredException(
          statusCode: dioError.response?.statusCode ?? 401,
          error: errorMessage,
          message: 'Session expired',
        );
      case DioExceptionType.connectionError:
        return NetworkConnectionException(
          statusCode: dioError.response?.statusCode ?? 408,
          error: dioError.response?.data['errors'],
          message: 'Connection error',
        );
      case DioExceptionType.unknown:
        return OthersException(
          statusCode: dioError.response?.statusCode ?? 500,
          error: errorMessage,
          message: 'Unknown error',
        );
    }
  }
}
