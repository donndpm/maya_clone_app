import 'package:flutter/material.dart';
import 'package:maya_clone_app/utils/constants.dart';
import 'package:maya_clone_app/utils/upper_case_formatter.dart';

class AuthInputText extends StatefulWidget {
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
  State<AuthInputText> createState() => _AuthInputTextState();
}

class _AuthInputTextState extends State<AuthInputText> {
  bool hasChanged = false;

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
                  widget.label,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value != '') {
                        hasChanged = true;
                        return;
                      }

                      hasChanged = false;
                    });
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: widget.controller,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0.0),
                    isDense: true,
                    hintText: widget.placeholder,
                  ),
                  inputFormatters: [
                    UpperCaseFormatter(),
                  ],
                  textInputAction: widget.inputAction,
                  enabled: widget.isEnable ?? true,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: widget.isError && !hasChanged
                ? Text(
                    widget.errorText ?? '',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    ),
                  )
                : Container(),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
