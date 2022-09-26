import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(CreateAccountInit()) {
    on<ValidatePersonalDtlFields>(validatePersonalDtlFields);
    on<ValidateLoginDtlFields>(validateLoginDtlFields);
  }

  validatePersonalDtlFields(ValidatePersonalDtlFields event, Emitter emit) {
    String firstNameErrorMsg = '';
    String lastNameErrorMsg = '';
    String emailErrorMsg = '';
    bool isError = false;

    emit(CreateAccountInit());

    if (event.firstName == '') {
      firstNameErrorMsg = 'Please fill in your first name.';
      isError = true;
    }

    if (event.lastName == '') {
      lastNameErrorMsg = 'Please fill in your last name.';
      isError = true;
    }

    if (event.email == '') {
      emailErrorMsg = 'Please fill in your email address.';
      isError = true;
    }

    if (isError) {
      emit(
        TextFieldError(
          firstNameErrorMsg: firstNameErrorMsg,
          lastNameErrorMsg: lastNameErrorMsg,
          emailErrorMsg: emailErrorMsg,
        ),
      );
      return;
    }

    emit(TextFieldValid());
  }

  validateLoginDtlFields(ValidateLoginDtlFields event, Emitter emit) {
    String phoneNumberErrorMsg = '';
    String passwordErrorMsg = '';

    bool isError = false;

    emit(CreateAccountInit());

    if (event.phoneNumber == '') {
      phoneNumberErrorMsg = 'Please fill in your phone number.';
      isError = true;
    }

    if (event.password == '') {
      passwordErrorMsg = 'Please fill in your desired password.';
      isError = true;
    }

    if (isError) {
      emit(
        TextFieldError(
          phoneNumberErrorMsg: phoneNumberErrorMsg,
          passwordErrorMsg: passwordErrorMsg,
        ),
      );
      return;
    }

    emit(TextFieldValid());
  }
}
