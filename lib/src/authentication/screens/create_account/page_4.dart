import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';

import '../shared/auth_primary_btn.dart';

class CreateAccountPage4 extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  const CreateAccountPage4({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
  });

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
          const SizedBox(
            height: 8,
          ),
          AuthInputText(
            label: 'Last name',
            controller: lastNameController,
            isEnable: false,
          ),
          const SizedBox(
            height: 8,
          ),
          AuthInputText(
            label: 'Email address',
            controller: emailController,
            isEnable: false,
          ),
          const SizedBox(
            height: 8,
          ),
          AuthInputText(
            label: 'Phone number',
            controller: phoneNumberController,
            isEnable: false,
          ),
          const Spacer(),
          AuthPrimaryBtn(
            label: 'PROCEED',
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
