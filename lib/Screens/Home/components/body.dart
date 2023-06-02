import 'package:flutter/material.dart';
import 'package:taxi_driver_app/Screens/Home/components/Profile/profile.dart';
import 'package:taxi_driver_app/Screens/Home/components/filtersBanner.dart';
import 'package:taxi_driver_app/Screens/Home/components/floatingAddButton.dart';
import 'package:taxi_driver_app/Screens/Home/components/searchInput.dart';
import 'package:taxi_driver_app/Screens/Home/components/cardsList.dart';
import 'package:taxi_driver_app/constants.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        toolbarHeight: 130.10,
        flexibleSpace: SafeArea(
          child: Container(
            child: Column(
              children: [
                FiltersBanner(
                  press: () {
                    // Scaffold.of(context).openEndDrawer();
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
                SearchInput(),
              ],
            ),
          ),
        ),
        // leading: null,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: CardsList(),
      ),
      floatingActionButton: const FloatingAddButton(),
      endDrawer: Profile(),
    );
  }
}
