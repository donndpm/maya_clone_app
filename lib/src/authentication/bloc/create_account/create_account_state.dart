part of 'create_account_bloc.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class TextFieldValid extends CreateAccountState {}

class TextFieldError extends CreateAccountState {
  final String firstNameErrorMsg;
  final String lastNameErrorMsg;
  final String emailErrorMsg;
  final String phoneNumberErrorMsg;
  final String passwordErrorMsg;

  const TextFieldError({
    this.firstNameErrorMsg = '',
    this.lastNameErrorMsg = '',
    this.emailErrorMsg = '',
    this.phoneNumberErrorMsg = '',
    this.passwordErrorMsg = '',
  });

  @override
  List<Object> get props => [
        firstNameErrorMsg,
        lastNameErrorMsg,
        emailErrorMsg,
        phoneNumberErrorMsg,
        passwordErrorMsg,
      ];
}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountAuthenticated extends CreateAccountState {}

class CreateAccountError extends CreateAccountState {
  final String error;

  const CreateAccountError(this.error);

  @override
  List<Object> get props => [error];
}
