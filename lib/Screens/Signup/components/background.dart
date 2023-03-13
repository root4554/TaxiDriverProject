import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.2 * -1,
            right: size.width * 0.4 * -1,
            child: SvgPicture.asset(
              "assets/icons/blob1.svg",
              semanticsLabel: 'first shape',
              width: size.width * 1,
            ),
          ),
          Positioned(
            bottom: size.height * 0.3 * -1,
            left: size.width * 0.5 * -1,
            child: SvgPicture.asset(
              "assets/icons/blob2.svg",
              semanticsLabel: 'second shape',
              width: size.width * 1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
