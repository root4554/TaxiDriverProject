import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Home/components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';

late User loggedInUser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      final email = user!.email;
      final name = user.displayName;
      if (user != null) {
        loggedInUser = user;
        print("user name $name");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: kPrimaryLightColor),
        ),
      ),
      home: Body(),
    );
    // return Scaffold(
    // body: Body(),
    // );
  }
}
