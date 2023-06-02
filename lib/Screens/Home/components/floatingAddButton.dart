import 'package:flutter/material.dart';
import 'package:taxi_driver_app/constants.dart';

import 'AddAnnounce/add_announce_screen.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print("object");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddAnnouncementScreen();
            },
          ),
        );
      },
      backgroundColor: kPrimaryColor,
      child: const Icon(Icons.add),
    );
  }
}
