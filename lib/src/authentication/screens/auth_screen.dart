import 'package:flutter/material.dart';
import 'package:maya_clone_app/src/authentication/screens/create_account/create_account.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_primary_btn.dart';
import 'package:maya_clone_app/src/authentication/screens/shared/auth_secondary_btn.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              AuthPrimaryBtn(
                label: 'Start an account',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AuthSecondaryBtn(label: 'Login'),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
