import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jc_module/core/configs/exceptions/failure.dart';

part 'error_object.freezed.dart';

@freezed
class ErrorObject with _$ErrorObject {
  const factory ErrorObject({
    required String title,
    required int statusCode,
    required String message,
    required dynamic error,
  }) = _ErrorObject;

  factory ErrorObject.mapFailureToErrorObject({
    required Failure failure,
  }) {
    return failure.when(
      cacheFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'LOCAL_STORAGE_FAILURE',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into memory cache',
      ),
      conflictFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'CONFLICT_DATA',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into data memory',
      ),
      connectionTimeoutFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'NETWORK_TIMEOUT',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into network timeout',
      ),
      errorParametersFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'PARAMETERS_REQUEST',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into parameters request',
      ),
      internalServerErrorFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'INTERNAL_SERVER_ERROR',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into internal server error',
      ),
      invalidCredentialFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'INVALID_CREDENTIAL',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into invalid credential',
      ),
      localFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'LOCAL_STORAGE',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into local storage',
      ),
      networkConnectionFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'NETWORK_CONNECTION',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into network connection',
      ),
      notFoundFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'NOT_FOUND',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Error not found',
      ),
      othersFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'OTHER_ERROR',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Unknown error',
      ),
      parserErrorFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'PARSER_DATA',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into parser data',
      ),
      requestTimeOutFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'REQUEST_TIMEOUT',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into request timeout',
      ),
      serverCancelFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'SERVER_CANCEL',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into server cancel',
      ),
      serverSocketFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'SERVER_SOCKET',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into server socket',
      ),
      serviceUnAvailableFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'SERVICES_UNAVAILABLE',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into services unavailable',
      ),
      sessionExpiredFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'SESSION_EXPIRED',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into session expired',
      ),
      sessionNotFoundFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'SESSION_NOT_FOUND',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into session not found',
      ),
      undefinedFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'UNDEFINED_ERROR',
        statusCode: statusCode,
        error: error,
        message: message ?? '',
      ),
      undefinedOrUrlNotExistFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'UNDEFINED_OR_URL_NOT_EXIST',
        statusCode: statusCode,
        error: error,
        message:
            message ?? 'Some error happened into undefined or url not exist',
      ),
      registerInvalidFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'REGISTER_INVALID',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into register invalid',
      ),
      emptyDataFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'EMPTY_DATA',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into empty data',
      ),
      businessErrorFailure: (
        int statusCode,
        String? message,
        dynamic error,
      ) =>
          ErrorObject(
        title: 'BUSINESS_ERROR',
        statusCode: statusCode,
        error: error,
        message: message ?? 'Some error happened into business error',
      ),
    );
  }
}
