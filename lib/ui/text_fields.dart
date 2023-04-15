import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../utils/app_colors.dart';

typedef VoidCallbackString = String? Function(String?);

class PrimaryTextField extends StatefulWidget {
  final bool autofocus;
  final bool obscureText;
  final bool readonly;
  final String labelText;
  final TextStyle labelStyle;
  final TextInputType textInputType;
  final VoidCallbackString validator;
  final bool isPasswordField;

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
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      autofocus: widget.autofocus,
      readOnly: widget.readonly,
      cursorColor: AppColors.colorD7FFCA,
      controller: widget.controller,
      obscureText: widget.isPasswordField ? !_passwordVisible : false,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorD7FFCA, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorD7FFCA, width: 2),
        ),
        suffixIcon: (widget.isPasswordField == true) ? IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ) : null,
      ),
    );
  }
}
