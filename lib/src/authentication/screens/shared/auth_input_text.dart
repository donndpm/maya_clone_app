import 'package:flutter/material.dart';
import 'package:maya_clone_app/utils/constants.dart';
import 'package:maya_clone_app/utils/upper_case_formatter.dart';

class AuthInputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final bool? isEnable;
  final TextInputAction? inputAction;
  final bool isError;
  final String? errorText;

  const AuthInputText({
    super.key,
    required this.label,
    this.placeholder,
    required this.controller,
    this.inputAction,
    this.isEnable,
    this.isError = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: kMinDeviceWidth(context),
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
                  enableSuggestions: false,
                  autocorrect: false,
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
                  inputFormatters: [
                    UpperCaseFormatter(),
                  ],
                  textInputAction: inputAction,
                  enabled: isEnable ?? true,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: isError
                ? Text(
                    errorText ?? '',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
