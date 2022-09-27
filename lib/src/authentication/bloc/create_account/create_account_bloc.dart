import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:maya_clone_app/src/authentication/services/auth_repository.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final AuthRepository authRepository;

  CreateAccountBloc(this.authRepository) : super(CreateAccountInitial()) {
    on<NewPageTriggered>(newPageTriggered);
    on<ValidatePersonalDtlFields>(validatePersonalDtlFields);
    on<ValidateLoginDtlFields>(validateLoginDtlFields);
    on<TriggerCreateAccount>(triggerCreateAccount);
  }

  newPageTriggered(NewPageTriggered event, Emitter emit) {
    emit(CreateAccountInitial());
  }

  validatePersonalDtlFields(ValidatePersonalDtlFields event, Emitter emit) {
    String firstNameErrorMsg = '';
    String lastNameErrorMsg = '';

    bool isError = false;

    if (event.firstName == '') {
      firstNameErrorMsg = 'Please fill in your first name.';
      isError = true;
    }

    if (event.lastName == '') {
      lastNameErrorMsg = 'Please fill in your last name.';
      isError = true;
    }

    if (isError) {
      emit(
        TextFieldError(
          firstNameErrorMsg: firstNameErrorMsg,
          lastNameErrorMsg: lastNameErrorMsg,
        ),
      );
      return;
    }

    emit(TextFieldValid());
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
      emit(
        TextFieldError(
          emailErrorMsg: emailErrorMsg,
          passwordErrorMsg: passwordErrorMsg,
        ),
      );
      return;
    }

    emit(TextFieldValid());
  }

  triggerCreateAccount(TriggerCreateAccount event, Emitter emit) async {
    debugPrint('trigger create account');
    emit(CreateAccountLoading());

    try {
      final user = await authRepository.createUser(event.email, event.password);
      await authRepository.updateDisplayName(
          user, event.firstName, event.lastName);
      emit(CreateAccountAuthenticated());
    } catch (err) {
      emit(CreateAccountError(err.toString()));
      emit(CreateAccountInitial());
    }
  }
}
