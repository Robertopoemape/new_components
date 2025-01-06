import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.cacheFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = CacheFailure;
  const factory Failure.conflictFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ConflictFailure;
  const factory Failure.connectionTimeoutFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ConnectionTimeoutFailure;
  const factory Failure.errorParametersFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ErrorParametersFailure;
  const factory Failure.internalServerErrorFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = InternalServerErrorFailure;
  const factory Failure.invalidCredentialFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = InvalidCredentialFailure;
  const factory Failure.localFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = LocalFailure;
  const factory Failure.networkConnectionFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = NetworkConnectionFailure;
  const factory Failure.notFoundFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = NotFoundFailure;
  const factory Failure.othersFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = OthersFailure;
  const factory Failure.parserErrorFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ParserErrorFailure;
  const factory Failure.requestTimeOutFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = RequestTimeOutFailure;
  const factory Failure.serverCancelFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ServerCancelFailure;
  const factory Failure.serverSocketFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ServerSocketFailure;
  const factory Failure.serviceUnAvailableFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = ServiceUnAvailableFailure;
  const factory Failure.sessionExpiredFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = SessionExpiredFailure;
  const factory Failure.sessionNotFoundFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = SessionNotFoundFailure;
  const factory Failure.undefinedFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = UndefinedFailure;
  const factory Failure.undefinedOrUrlNotExistFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = UndefinedOrUrlNotExistFailure;
  const factory Failure.registerInvalidFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = RegisterInvalidFailure;
  const factory Failure.emptyDataFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = EmptyDataFailure;
  const factory Failure.businessErrorFailure({
    required int statusCode,
    String? message,
    dynamic error,
  }) = BusinessErrorFailure;
}
