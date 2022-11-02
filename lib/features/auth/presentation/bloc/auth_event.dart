part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInEvent(this.email, this.password);

}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignUpEvent(this.email, this.password);

}
