part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

class ValidatePersonalDtlFields extends CreateAccountEvent {
  final String firstName;
  final String lastName;
  final String email;

  const ValidatePersonalDtlFields(
    this.firstName,
    this.lastName,
    this.email,
  );

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
      ];
}

class ValidateLoginDtlFields extends CreateAccountEvent {
  final String phoneNumber;
  final String password;

  const ValidateLoginDtlFields(
    this.phoneNumber,
    this.password,
  );

  @override
  List<Object> get props => [
        phoneNumber,
        password,
      ];
}
