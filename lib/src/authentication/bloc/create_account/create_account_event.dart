part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class NewPageTriggered extends CreateAccountEvent {}

class ValidatePersonalDtlFields extends CreateAccountEvent {
  final String firstName;
  final String lastName;

  const ValidatePersonalDtlFields(
    this.firstName,
    this.lastName,
  );

  @override
  List<Object> get props => [
        firstName,
        lastName,
      ];
}

class ValidateLoginDtlFields extends CreateAccountEvent {
  final String email;
  final String password;

  const ValidateLoginDtlFields(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}
