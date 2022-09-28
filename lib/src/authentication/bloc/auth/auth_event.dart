part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CreateAccountEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const CreateAccountEvent(
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  );

  @override
  List<Object> get props => [
        email,
        password,
        firstName,
        lastName,
      ];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class SignOutEvent extends AuthEvent {}
