import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:taxi_driver_app/Screens/Login/login_screen.dart';
import 'package:taxi_driver_app/Screens/Signup/components/background.dart';
import 'package:taxi_driver_app/components/already_have_an_account_check.dart';
import 'package:taxi_driver_app/components/rounded_button.dart';
import 'package:taxi_driver_app/components/rounded_input_field.dart';
import 'package:taxi_driver_app/components/rounded_password_field.dart';
import 'package:taxi_driver_app/constants.dart';

import 'package:taxi_driver_app/Screens/Home/components/home.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? name;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: showSpinner,
      child: Background(
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
                TextInputType.name,
                hintText: "Your Full Name",
                icon: Icons.person,
                onChanged: (value) {
                  name = value;
                },
                iconColor: kPrimaryColor,
              ),
              RoundedInputField(
                TextInputType.emailAddress,
                hintText: "Your Email",
                icon: const IconData(0xe081, fontFamily: 'MaterialIcons'),
                onChanged: (value) {
                  email = value;
                },
                iconColor: kPrimaryColor,
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "SignUp",
                press: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email ?? "", password: password ?? "");
                    if (newUser != null) {
                      await _auth.currentUser!.updateDisplayName(name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                color: kPrimaryLightColor,
              ),
              AlearedyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
