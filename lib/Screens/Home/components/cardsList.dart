import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Home/components/announceCard.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.count(
      crossAxisCount: 2,
      children: const [
        AnnounceCard(
          imagePath: 'assets/images/tx1.png',
          city: 'Fez/Fes-Mekness',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx2.png',
          city: 'Rabat/Rabat-Agdal',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx3.png',
          city: 'Fez/Fes-Mekness',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx4.png',
          city: 'Rabat/Rabat-Agdal',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx2.png',
          city: 'Fez/Fes-Mekness',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx1.png',
          city: 'Rabat/Rabat-Agdal',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx4.png',
          city: 'Fez/Fes-Mekness',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx3.png',
          city: 'Rabat/Rabat-Agdal',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx1.png',
          city: 'Fez/Fes-Mekness',
          title: 'An experienced Driver needed',
        ),
        AnnounceCard(
          imagePath: 'assets/images/tx2.png',
          city: 'Rabat/Rabat-Agdal',
          title: 'An experienced Driver needed',
        )
      ],
    );
  }
}
