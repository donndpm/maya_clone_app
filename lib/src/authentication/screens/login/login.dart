import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_hidden_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_btn.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_text_btn.dart';
import 'package:maya_clone_app/src/wrapper/screens/wrapper_screen.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (loginContext, loginState) {
          String? emailErrorMsg;
          bool? isEmailError;
          String? passwordErrorMsg;
          bool? isPasswordError;

          if (loginState is TextFieldError) {
            if (loginState.emailErrorMsg != '') {
              isEmailError = true;
              emailErrorMsg = loginState.emailErrorMsg;
            }
            if (loginState.passwordErrorMsg != '') {
              isPasswordError = true;
              passwordErrorMsg = loginState.passwordErrorMsg;
            }
            if (loginState.emailErrorMsg != '') {
              isEmailError = true;
              emailErrorMsg = loginState.emailErrorMsg;
            }
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              foregroundColor: Theme.of(context).colorScheme.onBackground,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  return;
                },
                icon: const Icon(FontAwesomeIcons.arrowLeft),
              ),
              elevation: 0.0,
            ),
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WrapperScreen(),
                      fullscreenDialog: true,
                    ),
                  );
                }
              },
              builder: (authContext, authState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Positioned(
                              top: 40,
                              child: Text(
                                'to your account',
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
                        label: 'Email address',
                        placeholder: 'Enter your registered email',
                        controller: emailController,
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
                      AuthPrimaryTextBtn(
                        label: 'Forgot your password',
                        onTap: () {},
                      ),
                      const Spacer(),
                      AuthPrimaryBtn(
                        label:
                            authState is Loading ? 'Please wait...' : 'Log in',
                        onTap: () {
                          loginContext.read<LoginBloc>().add(
                              ValidateLoginDtlFields(emailController.value.text,
                                  passwordController.value.text, authContext));
                          authContext.read<AuthBloc>().add(LoginEvent(
                              emailController.value.text,
                              passwordController.value.text));
                        },
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
