import 'package:core_components/navigation/model/page_destination.dart';
import 'package:core_components/navigation/state/page_content_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallScreenNavigation extends StatefulWidget {
  final List<PageDestination> destinations;

  const SmallScreenNavigation({Key? key, required this.destinations})
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
      body: Provider.of<PageContentBuilder>(context).selectedWidget,
      bottomNavigationBar: NavigationBar(
        selectedIndex: Provider.of<PageContentBuilder>(context).selectedIndex,
        onDestinationSelected: (selectedScreenIndex) =>
            Provider.of<PageContentBuilder>(context, listen: false)
                .handleScreenChanged(selectedScreenIndex),
        destinations: widget.destinations.map(
          (PageDestination destination) {
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
