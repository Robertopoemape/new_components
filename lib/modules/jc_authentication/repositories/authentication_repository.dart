import 'package:fpdart/fpdart.dart';
import 'package:jc_module/jc_module.dart';

abstract class AuthenticationRemoteRepository {
  Future<Either<Failure, UserInfo>> login(String username, String password);
  Future<Either<Failure, TokenData>> getRefreshToken(String refreshToken);
  Future<Either<Failure, void>> logout();
}

class AuthenticationRemoteRepositoryImpl
    implements AuthenticationRemoteRepository {
  AuthenticationRemoteRepositoryImpl();
  final AuthenticationRemoteService _authenticationRemoteService =
      AuthenticationRemoteServiceImpl();

  @override
  Future<Either<Failure, TokenData>> getRefreshToken(String refreshToken) =>
      futureDecorator(
        () => _authenticationRemoteService.getRefreshToken(
          refreshToken: refreshToken,
        ),
      );

  @override
  Future<Either<Failure, UserInfo>> login(String username, String password) =>
      futureDecorator(
        () => _authenticationRemoteService.login(
          username: username,
          password: password,
        ),
      );

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _authenticationRemoteService.logout();
      return right(null);
    } on Exception catch (e) {
      return left(
        Failure.localFailure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }
}
