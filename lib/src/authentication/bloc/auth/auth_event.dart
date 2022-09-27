part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class TriggerCreateAccount extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const TriggerCreateAccount(
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

class TriggerLoginUser extends AuthEvent {
  final String email;
  final String password;

  const TriggerLoginUser(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
