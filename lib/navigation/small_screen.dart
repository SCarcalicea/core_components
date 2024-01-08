import 'package:core_components/navigation/page_destination.dart';
import 'package:core_components/navigation/screen_index_mixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_model.dart';
import 'destination_configuration.dart';

class SmallScreenNavigation extends StatefulWidget with ScreenIndexMixin {

  SmallScreenNavigation({Key? key}) : super(key: key);

  @override
  State<SmallScreenNavigation> createState() => _SmallScreenNavigationState();
}

class _SmallScreenNavigationState extends State<SmallScreenNavigation> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Page Index = ${widget.screenIndex}'),
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.screenIndex,
        onDestinationSelected: handleScreenChanged,
        destinations: destinations.map(
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

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      widget.screenIndex = selectedScreen;
    });
  }
}