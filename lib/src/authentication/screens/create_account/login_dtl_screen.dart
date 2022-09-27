import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_clone_app/src/authentication/bloc/create_account/page_controller/create_account_page_controller_cubit.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';

import '../../bloc/create_account/create_account_bloc.dart';
import '../shared/auth_hidden_text.dart';
import '../shared/auth_primary_btn.dart';

class LoginDtlScreen extends StatelessWidget {
  final PageController pageController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginDtlScreen({
    super.key,
    required this.pageController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountPageControllerCubit, int>(
      builder: (context, index) {
        return BlocConsumer<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if (state is TextFieldValid) {
              context
                  .read<CreateAccountPageControllerCubit>()
                  .togglePage(context, pageController, index, index + 1);
            }
          },
          builder: (context, state) {
            String? emailErrorMsg;
            String? passwordErrorMsg;

            bool? isEmailError;
            bool? isPasswordError;

            if (state is TextFieldError) {
              if (state.emailErrorMsg != '') {
                isEmailError = true;
                emailErrorMsg = state.emailErrorMsg;
              }
              if (state.passwordErrorMsg != '') {
                isPasswordError = true;
                passwordErrorMsg = state.passwordErrorMsg;
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Text(
                          'Set your',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          child: Text(
                            'login details',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // AuthInputText(
                  //   label: 'Phone number',
                  //   placeholder: '09xx-xxx-xxxx',
                  //   controller: phoneNumberController,
                  //   inputAction: TextInputAction.next,
                  //   isError: isPhoneNumberError ?? false,
                  //   errorText: phoneNumberErrorMsg,
                  // ),
                  AuthInputText(
                    label: 'Email',
                    placeholder: 'Enter email address',
                    controller: emailController,
                    inputAction: TextInputAction.done,
                    isError: isEmailError ?? false,
                    errorText: emailErrorMsg,
                  ),
                  AuthHiddenText(
                    label: 'Password',
                    placeholder: 'Enter password',
                    controller: passwordController,
                    isError: isPasswordError ?? false,
                    errorText: passwordErrorMsg,
                  ),
                  const Spacer(),
                  AuthPrimaryBtn(
                      label: 'Continue',
                      onTap: () {
                        context.read<CreateAccountBloc>().add(
                              ValidateLoginDtlFields(emailController.value.text,
                                  passwordController.value.text),
                            );
                      }),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
