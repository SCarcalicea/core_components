import 'package:flutter/material.dart';

import '../../../fire_core_components.dart';

class SmallScreenNavigation extends StatefulWidget {
  final List<PageDestinationModel> destinations;
  final PageContentBuilderInterface contentBuilderListener;
  final PageContentBuilderInterface contentBuilderNoListen;

  const SmallScreenNavigation({
    Key? key,
    required this.destinations,
    required this.contentBuilderListener,
    required this.contentBuilderNoListen})
      : super(key: key);

  @override
  State<SmallScreenNavigation> createState() => _SmallScreenNavigationState();
}

class _SmallScreenNavigationState extends State<SmallScreenNavigation> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: widget.contentBuilderListener.selectedWidget,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.contentBuilderListener.selectedIndex,
        onDestinationSelected: (selectedScreenIndex) =>
            widget.contentBuilderNoListen.handleScreenChanged(selectedScreenIndex),
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
