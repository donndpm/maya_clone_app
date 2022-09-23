import 'package:flutter/material.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_text_btn.dart';

import '../shared/auth_primary_btn.dart';

class CreateAccountPage1 extends StatelessWidget {
  final Function nextPage;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  const CreateAccountPage1(
      {super.key,
      required this.nextPage,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController});

  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(
            height: 10,
          ),
          AuthInputText(
            label: 'Last name',
            placeholder: 'Enter last name',
            controller: lastNameController,
            inputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 10,
          ),
          AuthInputText(
            label: 'Email',
            placeholder: 'Enter email address',
            controller: emailController,
            inputAction: TextInputAction.done,
          ),
          const Spacer(),
          AuthPrimaryBtn(
            label: 'Continue',
            onTap: () => nextPage(),
          ),
          AuthPrimaryTextBtn(
            label: 'Log in to your existing account',
            onTap: () {},
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
