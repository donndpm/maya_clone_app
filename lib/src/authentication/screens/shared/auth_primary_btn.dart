import 'package:flutter/material.dart';
import 'package:maya_clone_app/utils/constants.dart';

class AuthPrimaryBtn extends StatelessWidget {
  final String label;
  final Function onTap;

  const AuthPrimaryBtn({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width < 768 ? double.infinity : 768,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRaduis),
          color: Theme.of(context).colorScheme.primary.withGreen(163),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
          ),
        ),
      ),
    );
  }
}
