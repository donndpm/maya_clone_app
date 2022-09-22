import 'package:flutter/material.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';

import '../shared/auth_primary_btn.dart';

class CreateAccountPage1 extends StatelessWidget {
  final Function nextPage;
  const CreateAccountPage1({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

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
                        color: Theme.of(context).colorScheme.primary),
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
          ),
          const SizedBox(
            height: 10,
          ),
          AuthInputText(
            label: 'Last name',
            placeholder: 'Enter last name',
            controller: lastNameController,
          ),
          Spacer(),
          AuthPrimaryBtn(
            label: 'Continue',
            onTap: () => nextPage(),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
