import 'package:flutter/material.dart';
import 'package:taxi_driver_app/components/rounded_input_field.dart';
import 'package:taxi_driver_app/constants.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedInputField(
          hintText: "Search TaxiDriver",
          icon: const IconData(0xf34b, fontFamily: 'MaterialIcons'),
          onChanged: (value) {},
          iconColor: kRedColor,
        ),
      ],
    );
  }
}
