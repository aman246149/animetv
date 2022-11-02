import 'package:animetv/features/auth/data/auth_repository.dart';
import 'package:animetv/features/auth/domain/entity/loginEntity.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase(this.repository);

  Future<dynamic> handleSignIn(LoginEntity loginEntity) async {
    try {
      await repository.signIn(loginEntity);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> handleSignUp(LoginEntity loginEntity) async {
    try {
      await repository.signUp(loginEntity);
    } catch (e) {
      rethrow;
    }
  }
}
