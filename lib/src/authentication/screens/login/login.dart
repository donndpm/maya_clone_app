import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_hidden_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_input_text.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_btn.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_text_btn.dart';

class LoginScreen extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
                controller: phoneNumberController),
            AuthHiddenText(
                label: 'label',
                placeholder: 'Enter password',
                controller: passwordController),
            AuthPrimaryTextBtn(
              label: 'Forgot your password',
              onTap: () {},
            ),
            const Spacer(),
            AuthPrimaryBtn(
              label: 'Log in',
              onTap: () {},
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
