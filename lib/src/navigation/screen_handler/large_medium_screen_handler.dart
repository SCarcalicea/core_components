import 'package:flutter/material.dart';

import '../model/page_destination_model.dart';
import '../state/page_content_builder_interface.dart';

/// This widget is handling the building process of all components which are designed for a medium/large screen.
class LargeMediumScreenHandler extends StatefulWidget {
  /// List of PageDestinationModel for the bottom icons
  final List<PageDestinationModel> destinations;

  /// Handler for selected index and widget mapping
  final PageContentBuilderInterface contentBuilderListener;

  /// Handler for the widget loading
  final PageContentBuilderInterface contentBuilderNoListen;

  /// Requires a list of PageDestinationModel and handlers for widget selection and switching.
  const LargeMediumScreenHandler(
      {super.key,
      required this.destinations,
      required this.contentBuilderListener,
      required this.contentBuilderNoListen});

  @override
  State<LargeMediumScreenHandler> createState() =>
      _LargeMediumScreenHandlerState();
}

class _LargeMediumScreenHandlerState extends State<LargeMediumScreenHandler> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: buildNavigationRail(context),
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: widget.contentBuilderListener.selectedWidget),
            ],
          ),
        ));
  }

  NavigationRail buildNavigationRail(BuildContext context) {
    return NavigationRail(
      extended: MediaQuery.of(context).size.width >= 800,
      destinations: widget.destinations.map(
        (PageDestinationModel destination) {
          return NavigationRailDestination(
            label: Text(destination.label,
                style: Theme.of(context).textTheme.labelLarge),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        },
      ).toList(),
      selectedIndex: widget.contentBuilderListener.selectedIndex,
      useIndicator: true,
      onDestinationSelected: (selectedScreenIndex) => widget
          .contentBuilderNoListen
          .handleScreenChanged(selectedScreenIndex),
    );
  }
}
