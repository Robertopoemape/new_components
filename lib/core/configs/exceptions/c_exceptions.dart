import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_exceptions.freezed.dart';

@freezed
class CException with _$CException {
  @Implements<Exception>()
  const factory CException.cacheException({
    required int statusCode,
    @Default('cacheException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = CacheException;
  @Implements<Exception>()
  const factory CException.conflictException({
    required int statusCode,
    @Default('conflictException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ConflictException;
  @Implements<Exception>()
  const factory CException.connectTimeOutException({
    required int statusCode,
    @Default('connectTimeOutException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ConnectTimeOutException;
  @Implements<Exception>()
  const factory CException.parametersException({
    required int statusCode,
    @Default('parametersException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ParametersException;
  @Implements<Exception>()
  const factory CException.internalServerErrorException({
    required int statusCode,
    @Default('internalServerErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = InternalServerErrorException;
  @Implements<Exception>()
  const factory CException.invalidCredentialsException({
    required int statusCode,
    @Default('invalidCredentialsException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = InvalidCredentialsException;
  @Implements<Exception>()
  const factory CException.localException({
    required int statusCode,
    @Default('localException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = LocalException;
  @Implements<Exception>()
  const factory CException.networkConnectionException({
    required int statusCode,
    @Default('networkConnectionException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = NetworkConnectionException;
  @Implements<Exception>()
  const factory CException.notFoundException({
    required int statusCode,
    @Default('notFoundException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = NotFoundException;
  @Implements<Exception>()
  const factory CException.othersException({
    required int statusCode,
    @Default('othersException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = OthersException;
  @Implements<Exception>()
  const factory CException.parserErrorException({
    required int statusCode,
    @Default('parserErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ParserErrorException;
  @Implements<Exception>()
  const factory CException.requestTimeOutException({
    required int statusCode,
    @Default('requestTimeOutException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = RequestTimeOutException;
  @Implements<Exception>()
  const factory CException.serverCancelException({
    required int statusCode,
    @Default('serverCancelException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServerCancelException;
  @Implements<Exception>()
  const factory CException.serverSocketException({
    required int statusCode,
    @Default('serverSocketException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServerSocketException;
  @Implements<Exception>()
  const factory CException.serviceUnAvailableException({
    required int statusCode,
    @Default('serviceUnAvailableException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServiceUnAvailableException;
  @Implements<Exception>()
  const factory CException.sessionExpiredException({
    required int statusCode,
    @Default('sessionExpiredException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = SessionExpiredException;
  @Implements<Exception>()
  const factory CException.sessionNotFoundException({
    required int statusCode,
    @Default('sessionNotFoundException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = SessionNotFoundException;
  @Implements<Exception>()
  const factory CException.undefinedException({
    required int statusCode,
    @Default('undefinedException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = UndefinedException;
  @Implements<Exception>()
  const factory CException.undefinedOrUrlNotExistException({
    required int statusCode,
    @Default('undefinedOrUrlNotExistException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = UndefinedOrUrlNotExistException;
  @Implements<Exception>()
  const factory CException.registerInvalidException({
    required int statusCode,
    @Default('registerInvalidException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = RegisterInvalidException;
  @Implements<Exception>()
  const factory CException.emptyDataException({
    required int statusCode,
    @Default('emptyDataException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = EmptyDataException;
  @Implements<Exception>()
  const factory CException.businessErrorException({
    required int statusCode,
    @Default('businessErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = BusinessErrorException;
}
