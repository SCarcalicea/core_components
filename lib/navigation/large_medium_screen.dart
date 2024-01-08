import 'package:core_components/navigation/page_destination.dart';
import 'package:core_components/navigation/screen_index_mixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_model.dart';
import 'destination_configuration.dart';

class LargeMediumScreen extends StatefulWidget with ScreenIndexMixin {

  LargeMediumScreen({Key? key}) : super(key: key);

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
        bottom: false,
        top: false,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: NavigationRail(
                extended: MediaQuery.of(context).size.width >= 800,
                minWidth: 50,
                destinations: destinations.map(
                      (PageDestination destination) {
                    return NavigationRailDestination(
                      label: Text(destination.label),
                      icon: destination.icon,
                      selectedIcon: destination.selectedIcon,
                    );
                  },
                ).toList(),
                selectedIndex: widget.screenIndex,
                useIndicator: true,
                onDestinationSelected: handleScreenChanged,
              ),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Page Index = ${widget.screenIndex}'),
                  ElevatedButton(
                    onPressed: openDrawer,
                    child: const Text('Open Drawer'),
                  ),
                  Card(
                    child: Column(
                      children: [
                        const Text('Dark Mode'),
                        Switch(
                          value: Provider.of<ThemeModel>(context).currentTheme == ThemeData.dark(),
                          onChanged: (value) {
                            Provider.of<ThemeModel>(context, listen: false).toggleTheme();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: widget.screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          ...destinations.map(
                (PageDestination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      widget.screenIndex = selectedScreen;
    });
  }

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

}