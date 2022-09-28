import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/src/authentication/bloc/auth/auth_bloc.dart';

import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/src/wrapper/screens/wrapper_screen.dart';

import '../shared/auth_primary_btn.dart';

class FinalizeScreen extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  const FinalizeScreen({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
                      'Finalize your',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      child: Text(
                        'details',
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.circleInfo,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text('Please review your details before proceeding.',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AuthInputText(
                label: 'First name',
                controller: firstNameController,
                isEnable: false,
              ),
              AuthInputText(
                label: 'Last name',
                controller: lastNameController,
                isEnable: false,
              ),
              AuthInputText(
                label: 'Email address',
                controller: emailController,
                isEnable: false,
              ),
              const Spacer(),
              AuthPrimaryBtn(
                label: state is Loading ? 'Loading. Please wait...' : 'PROCEED',
                onTap: () {
                  if (state is Loading) {
                    return;
                  }

                  context.read<AuthBloc>().add(
                        CreateAccountEvent(
                          emailController.value.text,
                          passwordController.value.text,
                          firstNameController.value.text,
                          lastNameController.value.text,
                        ),
                      );
                },
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        );
      },
    );
  }
}
