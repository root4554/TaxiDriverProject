import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Login/login_screen.dart';
import 'package:taxi_driver_app/Screens/Signup/components/background.dart';
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
              "Welcome aboard",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Libre",
                fontSize: 32,
              ),
            ),
            const Text(
              "take a minut to fill this form",
              style: TextStyle(
                  fontFamily: "Comforta",
                  fontSize: 10,
                  fontWeight: FontWeight.w900),
            ),
            Image.asset(
              "assets/images/taxi3.jpeg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Full Name",
              icon: Icons.person,
              onChanged: (value) {},
              iconColor: kPrimaryColor,
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: const IconData(0xe081, fontFamily: 'MaterialIcons'),
              onChanged: (value) {},
              iconColor: kPrimaryColor,
            ),
            const RoundedPasswordField(),
            RoundedButton(
              text: "SignUp",
              press: () {},
              color: kPrimaryLightColor,
            ),
            AlearedyHaveAnAccountCheck(
              login: false,
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
            )
          ],
        ),
      ),
    );
  }
}
