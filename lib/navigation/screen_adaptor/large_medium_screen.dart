import 'package:core_components/navigation/model/page_destination.dart';
import 'package:core_components/navigation/state/page_content_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LargeMediumScreen extends StatefulWidget {
  final List<PageDestination> destinations;

  const LargeMediumScreen({Key? key, required this.destinations})
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
              Provider.of<PageContentBuilder>(context).selectedWidget,
            ],
          ),
        ));
  }

  NavigationRail buildNavigationRail(BuildContext context) {
    return NavigationRail(
      extended: MediaQuery.of(context).size.width >= 800,
      destinations: widget.destinations.map(
        (PageDestination destination) {
          return NavigationRailDestination(
            label: Text(destination.label,
                style: Theme.of(context).textTheme.labelLarge),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        },
      ).toList(),
      selectedIndex: Provider.of<PageContentBuilder>(context).selectedIndex,
      useIndicator: true,
      onDestinationSelected: (selectedScreenIndex) =>
          Provider.of<PageContentBuilder>(context, listen: false)
              .handleScreenChanged(selectedScreenIndex),
    );
  }
}
