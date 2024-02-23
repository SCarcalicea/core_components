import 'package:flutter/material.dart';

import '../../../fire_core_components.dart';

/// This widget is handling the building process of all components which are designed for a small screen.
class SmallScreenHandler extends StatefulWidget {
  /// List of PageDestinationModel for the bottom icons
  final List<PageDestinationModel> destinations;

  /// Handler for selected index and widget mapping
  final PageContentBuilderInterface contentBuilderListener;

  /// Handler for the widget loading
  final PageContentBuilderInterface contentBuilderNoListen;

  /// Requires a list of PageDestinationModel and handlers for widget selection and switching.
  const SmallScreenHandler(
      {super.key,
      required this.destinations,
      required this.contentBuilderListener,
      required this.contentBuilderNoListen});

  @override
  State<SmallScreenHandler> createState() => _SmallScreenHandlerState();
}

class _SmallScreenHandlerState extends State<SmallScreenHandler> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: widget.contentBuilderListener.selectedWidget,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.contentBuilderListener.selectedIndex,
        onDestinationSelected: (selectedScreenIndex) => widget
            .contentBuilderNoListen
            .handleScreenChanged(selectedScreenIndex),
        destinations: widget.destinations.map(
          (PageDestinationModel destination) {
            return NavigationDestination(
              label: destination.label,
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
              tooltip: destination.label,
            );
          },
        ).toList(),
      ),
    );
  }
}
