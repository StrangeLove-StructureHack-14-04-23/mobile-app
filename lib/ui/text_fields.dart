import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../utils/app_colors.dart';

typedef VoidCallbackString = String? Function(String?);

class PrimaryTextField extends StatelessWidget {
  final bool autofocus;
  final bool obscureText;
  final bool readonly;
  final String labelText;
  final TextStyle labelStyle;
  final TextInputType textInputType;
  final VoidCallbackString validator;

  final TextEditingController controller;

  PrimaryTextField({
    Key? key,
    this.autofocus = false,
    this.obscureText = false,
    this.readonly = false,
    this.textInputType = TextInputType.text,
    required this.controller,
    required this.labelText,
    required this.labelStyle,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      autofocus: autofocus,
      readOnly: readonly,
      cursorColor: AppColors.color7e56e8,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.color7e56e8, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.color7e56e8, width: 2),
        ),
      ),
    );
  }
}