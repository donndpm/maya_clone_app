import 'package:flutter/material.dart';

import '../shared/auth_primary_btn.dart';

class CreateAccountPage3 extends StatelessWidget {
  final Function nextPage;
  const CreateAccountPage3({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AuthPrimaryBtn(
        label: '3',
        onTap: () => nextPage(),
      ),
    );
  }
}
