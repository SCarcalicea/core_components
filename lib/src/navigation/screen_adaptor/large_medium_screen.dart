import 'package:flutter/material.dart';

import '../model/page_destination_model.dart';
import '../state/page_content_builder_interface.dart';


class LargeMediumScreen extends StatefulWidget {
  final List<PageDestinationModel> destinations;
  final PageContentBuilderInterface contentBuilderListener;
  final PageContentBuilderInterface contentBuilderNoListen;

  const LargeMediumScreen({
    Key? key,
    required this.destinations,
    required this.contentBuilderListener,
    required this.contentBuilderNoListen})
      : super(key: key);

  @override
  State<LargeMediumScreen> createState() => _LargeMediumScreenState();
}

class _LargeMediumScreenState extends State<LargeMediumScreen> {
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
              widget.contentBuilderListener.selectedWidget,
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
      onDestinationSelected: (selectedScreenIndex) =>
          widget.contentBuilderNoListen.handleScreenChanged(selectedScreenIndex),
    );
  }
}
