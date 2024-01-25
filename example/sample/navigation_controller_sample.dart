import 'package:fire_core_components/src/navigation/screen_handler/large_medium_screen_handler.dart';
import 'package:fire_core_components/src/navigation/screen_handler/small_screen_handler.dart';
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

    LargeMediumScreenHandler largeOrMediumScreen = LargeMediumScreenHandler(
        destinations: destinationsSample,
        contentBuilderListener: Provider.of<PageContentBuilderImpl>(context),
        contentBuilderNoListen: Provider.of<PageContentBuilderImpl>(context));

    SmallScreenHandler smallScreen = SmallScreenHandler(
        destinations: destinationsSample,
        contentBuilderListener: Provider.of<PageContentBuilderImpl>(context),
        contentBuilderNoListen: Provider.of<PageContentBuilderImpl>(context));

    return MediaQuery.of(context).size.width > 500
        ? largeOrMediumScreen
        : smallScreen;
  }
}
