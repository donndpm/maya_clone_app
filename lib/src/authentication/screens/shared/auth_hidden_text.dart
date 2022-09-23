import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maya_clone_app/utils/constants.dart';

class AuthHiddenText extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;

  const AuthHiddenText(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.controller});

  @override
  State<AuthHiddenText> createState() => _AuthHiddenTextState();
}

class _AuthHiddenTextState extends State<AuthHiddenText> {
  var hidePassword = true;

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
              widget.label,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            TextField(
              controller: widget.controller,
              style: const TextStyle(
                fontSize: 15,
              ),
              obscureText: hidePassword,
              cursorHeight: 20,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
                isDense: true,
                hintText: widget.placeholder,
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Icon(
                    hidePassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
