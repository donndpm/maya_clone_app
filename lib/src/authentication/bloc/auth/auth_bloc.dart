import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maya_clone_app/src/authentication/services/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(UnAuthenticated()) {
    on<TriggerCreateAccount>(triggerCreateAccount);
    on<TriggerLoginUser>(triggerLoginUser);
  }

  triggerCreateAccount(TriggerCreateAccount event, Emitter emit) async {
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

  triggerLoginUser(TriggerLoginUser event, Emitter emit) async {
    emit(Loading());

    try {
      await authRepository.loginUser(event.email, event.password);
      emit(Authenticated());
    } catch (err) {
      emit(AuthError(err.toString()));
      emit(UnAuthenticated());
    }
  }
}
