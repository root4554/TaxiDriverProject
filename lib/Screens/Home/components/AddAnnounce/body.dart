import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../components/rounded_button.dart';
import '../../../../components/rounded_input_field.dart';
import '../../../../constants.dart';
import '../home.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _AddAnnouncementScreenState createState() => _AddAnnouncementScreenState();
}

class _AddAnnouncementScreenState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? title;
  String? region;
  String? description;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: const Text(
                    "new",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Libre",
                      fontSize: 18,
                    ),
                  ),
                ),
                RoundedInputField(
                  TextInputType.text,
                  hintText: "Announcement Title",
                  icon: Icons.all_inbox,
                  onChanged: (value) {
                    title = value;
                  },
                  iconColor: kPrimaryColor,
                ),
                RoundedInputField(
                  TextInputType.text,
                  hintText: "Region/City",
                  icon: Icons.map_outlined,
                  onChanged: (value) {
                    region = value;
                  },
                  iconColor: kPrimaryColor,
                ),
                RoundedInputField(
                  TextInputType.text,
                  hintText: "Announcement Description",
                  icon: Icons.info_outline_rounded,
                  onChanged: (value) {
                    description = value;
                  },
                  iconColor: kPrimaryColor,
                ),
                RoundedButton(
                  text: "Create Announcement",
                  press: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final currentUser = _auth.currentUser;
                      if (currentUser != null) {
                        // Create a new announcement document in Firebase Firestore
                        await _firestore.collection('announcements').add({
                          'title': title,
                          'region': region,
                          'description': description,
                          'userId': currentUser.uid,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );

                        await _firestore
                            .collection("announcements")
                            .get()
                            .then((event) {
                          for (var doc in event.docs) {
                            print("${doc.id} => ${doc.data()}");
                          }
                        });
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
