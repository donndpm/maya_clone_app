import 'package:flutter/material.dart';

class AuthPrimaryTextBtn extends StatelessWidget {
  final String label;
  final Function onTap;
  const AuthPrimaryTextBtn(
      {super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                fontWeightDelta: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
