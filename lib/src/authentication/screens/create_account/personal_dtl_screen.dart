import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_clone_app/src/authentication/bloc/create_account/create_account_bloc.dart';
import 'package:maya_clone_app/src/authentication/bloc/create_account/page_controller/create_account_page_controller_cubit.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_text_btn.dart';

import '../shared/auth_primary_btn.dart';

class PersonalDtlScreen extends StatelessWidget {
  final PageController pageController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  const PersonalDtlScreen({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountPageControllerCubit, int>(
      builder: (context, index) {
        return BlocConsumer<CreateAccountBloc, CreateAccountState>(
          listener: (context, state) {
            if (state is TextFieldValid) {
              BlocProvider.of<CreateAccountPageControllerCubit>(context)
                  .togglePage(context, pageController, index, index + 1);
            }
          },
          builder: (context, state) {
            String? firstNameErrorMsg;
            String? lastNameErrorMsg;
            String? emailErrorMsg;
            bool? isFirstNameError;
            bool? isLastNameError;
            bool? isEmailError;

            if (state is TextFieldError) {
              if (state.firstNameErrorMsg != '') {
                isFirstNameError = true;
                firstNameErrorMsg = state.firstNameErrorMsg;
              }
              if (state.lastNameErrorMsg != '') {
                isLastNameError = true;
                lastNameErrorMsg = state.lastNameErrorMsg;
              }
              if (state.emailErrorMsg != '') {
                isEmailError = true;
                emailErrorMsg = state.emailErrorMsg;
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
                          'Start an',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          child: Text(
                            'account',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthInputText(
                    label: 'First name',
                    placeholder: 'Enter first name',
                    controller: firstNameController,
                    inputAction: TextInputAction.next,
                    isError: isFirstNameError ?? false,
                    errorText: firstNameErrorMsg,
                  ),
                  AuthInputText(
                    label: 'Last name',
                    placeholder: 'Enter last name',
                    controller: lastNameController,
                    inputAction: TextInputAction.next,
                    isError: isLastNameError ?? false,
                    errorText: lastNameErrorMsg,
                  ),
                  // AuthInputText(
                  //   label: 'Email',
                  //   placeholder: 'Enter email address',
                  //   controller: emailController,
                  //   inputAction: TextInputAction.done,
                  //   isError: isEmailError ?? false,
                  //   errorText: emailErrorMsg,
                  // ),
                  const Spacer(),
                  AuthPrimaryBtn(
                    label: 'Continue',
                    isEnable: true,
                    onTap: () {
                      debugPrint('tap tap tap');
                      context
                          .read<CreateAccountBloc>()
                          .add(ValidatePersonalDtlFields(
                            firstNameController.value.text,
                            lastNameController.value.text,
                          ));
                    },
                  ),
                  AuthPrimaryTextBtn(
                    label: 'Log in to your existing account',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 40,
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
