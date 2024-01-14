import 'package:fire_core_components/fire_core_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_content_builder_impl.dart';
import 'destination_configuration_sample.dart';

class NavigationControllerSample extends StatefulWidget {
  const NavigationControllerSample({super.key});

  @override
  State<NavigationControllerSample> createState() =>
      _NavigationControllerSampleState();
}

class _NavigationControllerSampleState extends State<NavigationControllerSample> {

  @override
  Widget build(BuildContext context) {

    LargeMediumScreen largeOrMediumScreen = LargeMediumScreen(
        destinations: destinationsSample,
        contentBuilderListener: Provider.of<PageContentBuilderImpl>(context),
        contentBuilderNoListen: Provider.of<PageContentBuilderImpl>(context));
    SmallScreenNavigation smallScreen = SmallScreenNavigation(
        destinations: destinationsSample,
        contentBuilderListener: Provider.of<PageContentBuilderImpl>(context),
        contentBuilderNoListen: Provider.of<PageContentBuilderImpl>(context));

    return MediaQuery.of(context).size.width > 500
        ? largeOrMediumScreen
        : smallScreen;
  }
}
