import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Home/home.dart';
import 'package:taxi_driver_app/Screens/Login/components/background.dart';
import 'package:taxi_driver_app/Screens/Signup/signup_screen.dart';
import 'package:taxi_driver_app/components/already_have_an_account_check.dart';
import 'package:taxi_driver_app/components/rounded_button.dart';
import 'package:taxi_driver_app/components/rounded_input_field.dart';
import 'package:taxi_driver_app/components/rounded_password_field.dart';
import 'package:taxi_driver_app/constants.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Libre",
                fontSize: 32,
              ),
            ),
            Image.asset(
              "assets/images/taxi2.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: const IconData(0xe081, fontFamily: 'MaterialIcons'),
              onChanged: (value) {},
              iconColor: kPrimaryColor,
            ),
            const RoundedPasswordField(),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
              color: kPrimaryLightColor,
            ),
            AlearedyHaveAnAccountCheck(
              login: true,
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
