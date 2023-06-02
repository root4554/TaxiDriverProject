import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:taxi_driver_app/Screens/Home/components/home.dart';
import 'package:taxi_driver_app/Screens/Login/components/background.dart';
import 'package:taxi_driver_app/Screens/Signup/signup_screen.dart';
import 'package:taxi_driver_app/components/already_have_an_account_check.dart';
import 'package:taxi_driver_app/components/rounded_button.dart';
import 'package:taxi_driver_app/components/rounded_input_field.dart';
import 'package:taxi_driver_app/components/rounded_password_field.dart';
import 'package:taxi_driver_app/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
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
                text: "LOGIN",
                press: () async {
                  print(email);
                  print(password);
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
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

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return Home();
                  //     },
                  //   ),
                  // );
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
      ),
    );
  }
}
