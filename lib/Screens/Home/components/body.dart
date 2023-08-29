import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Home/components/filtersBanner.dart';
import 'package:taxi_driver_app/Screens/Home/components/floatingAddButton.dart';
import 'package:taxi_driver_app/Screens/Home/components/searchInput.dart';
import 'package:taxi_driver_app/Screens/Home/components/cardsList.dart';
import 'package:taxi_driver_app/constants.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        toolbarHeight: 120.10,
        flexibleSpace: SafeArea(
            child: Container(
          // color: Color.fromARGB(38, 255, 199, 30),
          child: const Column(
            children: [
              FiltersBanner(),
              SearchInput(),
            ],
          ),
        )),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: CardsList(),
      ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}
