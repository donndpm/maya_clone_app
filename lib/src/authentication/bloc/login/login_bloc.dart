import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_clone_app/src/authentication/bloc/auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginAccountEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<ValidateLoginDtlFields>(validateLoginDtlFields);
  }

  validateLoginDtlFields(ValidateLoginDtlFields event, Emitter emit) {
    String emailErrorMsg = '';
    String passwordErrorMsg = '';

    bool isError = false;

    if (event.email == '') {
      emailErrorMsg = 'Please fill in your email address.';
      isError = true;
    }

    if (event.password == '') {
      passwordErrorMsg = 'Please fill in your desired password.';
      isError = true;
    }

    if (isError) {
      emit(TextFieldError(emailErrorMsg, passwordErrorMsg));
      return;
    }

    event.context.read<AuthBloc>().add(LoginEvent(event.email, event.password));

    emit(LoginInitial());
  }
}
