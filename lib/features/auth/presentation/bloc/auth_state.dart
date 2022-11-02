part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthSignInLoadingState extends AuthState {}

class AuthSignInSuccessFullState extends AuthState {}

class AuthSignInFailureState extends AuthState {
  final String message;

  AuthSignInFailureState(this.message);

}

class AuthSignUpLoadingState extends AuthState {}

class AuthSignUpSuccessFullState extends AuthState {}

class AuthSignUpFailureState extends AuthState {
  final String message;

  AuthSignUpFailureState(this.message);

}
