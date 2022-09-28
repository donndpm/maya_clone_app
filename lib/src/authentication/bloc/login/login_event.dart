part of 'login_bloc.dart';

abstract class LoginAccountEvent extends Equatable {
  const LoginAccountEvent();

  @override
  List<Object> get props => [];
}

class ValidateLoginDtlFields extends LoginAccountEvent {
  final BuildContext context;
  final String email;
  final String password;

  const ValidateLoginDtlFields(this.email, this.password, this.context);

  @override
  List<Object> get props => [
        context,
        email,
        password,
      ];
}
