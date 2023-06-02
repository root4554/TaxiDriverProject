import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver_app/components/rounded_input_field.dart';
import 'package:taxi_driver_app/constants.dart';

import '../../../Welcome/welcome_screen.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void _signOut(context) async {
  //   try {
  //     await _auth.signOut();
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  //   } catch (e) {
  //     print(e);
  //   }

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 120.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: kRedColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: kRedColor,
              ),
            ),
            onTap: () => _signOut(context),
          ),
        ],
      ),
    );
  }
}
