import 'package:flutter/material.dart';
import 'package:taxi_driver_app/constants.dart';

class FiltersBanner extends StatelessWidget {
  final void Function() press;
  const FiltersBanner({
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: kRedColor,
            size: 30,
          ),
          const Text(
            "TaxiDriver",
            style: (TextStyle(
              fontFamily: "Libre",
              fontSize: 30,
              color: kRedColor,
            )),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              print("object");
              press();
            },
            icon: const Icon(
              Icons.settings,
              color: kRedColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
