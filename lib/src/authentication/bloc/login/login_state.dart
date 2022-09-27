part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginDtlAuthenticated extends LoginState {}

class TextFieldError extends LoginState {
  final String phoneNumber;
  final String password;

  const TextFieldError(
    this.phoneNumber,
    this.password,
  );

  @override
  List<Object> get props => [
        phoneNumber,
        password,
      ];
}
