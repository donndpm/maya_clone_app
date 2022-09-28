part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginDtlFieldValid extends LoginState {}

class TextFieldError extends LoginState {
  final String emailErrorMsg;
  final String passwordErrorMsg;

  const TextFieldError(
    this.emailErrorMsg,
    this.passwordErrorMsg,
  );

  @override
  List<Object> get props => [
        emailErrorMsg,
        passwordErrorMsg,
      ];
}
