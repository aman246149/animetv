import 'package:animetv/features/auth/domain/entity/loginEntity.dart';
import 'package:animetv/features/auth/domain/usecase/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authUsecase;
  AuthBloc(this.authUsecase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignInEvent>(handleAuthSignInEvent);
    on<AuthSignUpEvent>(handeAuthSignUpEvent);
  }

  void handleAuthSignInEvent(
      AuthSignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthSignInLoadingState());
      await authUsecase.handleSignIn(LoginEntity(event.email, event.password));
      emit(AuthSignInSuccessFullState());
    } catch (e) {
      emit(AuthSignInFailureState(e.toString()));
    }
  }

  void handeAuthSignUpEvent(
      AuthSignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthSignUpLoadingState());
      await authUsecase.handleSignUp(LoginEntity(event.email, event.password));
      emit(AuthSignUpSuccessFullState());
    } catch (e) {
      emit(AuthSignUpFailureState(e.toString()));
    }
  }
}
