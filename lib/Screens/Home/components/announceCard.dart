import 'package:flutter/material.dart';

class AnnounceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String city;
  const AnnounceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: size.height * 0.05,
        bottom: 0,
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          debugPrint('Card Tapped');
        },
        splashColor: Colors.blue,
        child: SizedBox(
          width: size.width * 0.45,
          height: size.height * 0.8,
          child: Column(children: <Widget>[
            Image.asset(
              imagePath,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(city),
            Text(title),
          ]),
        ),
      ),
    );
  }
}
