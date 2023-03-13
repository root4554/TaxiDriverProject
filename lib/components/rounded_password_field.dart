import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taxi_driver_app/components/text_field_container.dart';
import 'package:taxi_driver_app/constants.dart';
import 'package:taxi_driver_app/main.dart';

class RoundedPasswordField extends StatefulWidget {
  const RoundedPasswordField({Key? key}) : super(key: key);
  @override
  PasswordField createState() => PasswordField();
}

class PasswordField extends State<RoundedPasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          hintText: "Password",
          isDense: true, // Reduces height a bit
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.lock_rounded,
            size: 24,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
