import 'package:flutter/material.dart';
import 'package:taxi_driver_app/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final iconColor;
  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: iconColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
