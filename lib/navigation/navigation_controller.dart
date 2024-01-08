import 'package:core_components/navigation/large_medium_screen.dart';
import 'package:core_components/navigation/small_screen.dart';
import 'package:flutter/material.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() =>
      _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {

  LargeMediumScreen largeOrMediumScreen = LargeMediumScreen();
  SmallScreenNavigation smallScreen = SmallScreenNavigation();


  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 500
        ? largeOrMediumScreen
        : smallScreen;
  }
}
