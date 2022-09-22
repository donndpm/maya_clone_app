import 'package:flutter/material.dart';
import 'package:maya_clone_app/utils/constants.dart';

class AuthInputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;

  const AuthInputText(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < 768 ? double.infinity : 768,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRaduis),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextField(
              controller: controller,
              style: const TextStyle(
                fontSize: 15,
              ),
              cursorHeight: 20,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
                isDense: true,
                hintText: placeholder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
