import 'package:core_components/navigation/destination_usecase/destination_configuration.dart';
import 'package:core_components/navigation/screen_adaptor/large_medium_screen.dart';
import 'package:core_components/navigation/screen_adaptor/small_screen.dart';
import 'package:flutter/material.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() =>
      _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {

  LargeMediumScreen largeOrMediumScreen = const LargeMediumScreen(destinations: destinationsSample);
  SmallScreenNavigation smallScreen = const SmallScreenNavigation(destinations: destinationsSample);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 500
        ? largeOrMediumScreen
        : smallScreen;
  }
}
