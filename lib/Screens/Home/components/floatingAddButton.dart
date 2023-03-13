import 'package:flutter/material.dart';
import 'package:taxi_driver_app/constants.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: kPrimaryColor,
      child: const Icon(Icons.add),
    );
  }
}
