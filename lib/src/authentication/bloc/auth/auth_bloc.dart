import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maya_clone_app/src/authentication/services/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(UnAuthenticated()) {
    on<CreateAccountEvent>(triggerCreateAccount);
    on<LoginEvent>(triggerLoginUser);
    on<SignOutEvent>(triggerSignOut);
  }

  triggerCreateAccount(CreateAccountEvent event, Emitter emit) async {
    emit(Loading());

    try {
      final user = await authRepository.createUser(event.email, event.password);
      await authRepository.updateDisplayName(
          user, event.firstName, event.lastName);
      emit(Authenticated());
    } catch (err) {
      emit(AuthError(err.toString()));
      emit(UnAuthenticated());
    }
  }

  triggerLoginUser(LoginEvent event, Emitter emit) async {
    emit(Loading());

    try {
      await authRepository.loginUser(event.email, event.password);
      emit(Authenticated());
    } catch (err) {
      emit(AuthError(err.toString()));
      emit(UnAuthenticated());
    }
  }

  triggerSignOut(SignOutEvent event, Emitter emit) async {
    emit(Loading());
    try {
      await authRepository.signOutUser();
      emit(UnAuthenticated());
    } catch (err) {
      emit(AuthError(err.toString()));
      emit(Authenticated());
    }
  }
}
