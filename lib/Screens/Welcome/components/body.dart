import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Login/login_screen.dart';
import 'package:taxi_driver_app/Screens/Signup/signup_screen.dart';
import 'package:taxi_driver_app/Screens/Welcome/components/background.dart';
import 'package:taxi_driver_app/components/rounded_button.dart';
import 'package:taxi_driver_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcom to TaxiDriver",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Libre',
                fontSize: 32,
              ),
            ),
            Image.asset(
              "assets/images/taxi1.png",
              height: size.height * 0.35,
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              color: kPrimaryLightColor,
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kSecondaryColor,
              textColor: kRedColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
