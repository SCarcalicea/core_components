import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This object represents a switch used for the dynamic change of the theme
class ThemeSwitcher {
  Widget switchTheme(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            const Text('Dark Mode'),
            Switch(
              value: Provider.of<ThemeModel>(context).currentTheme ==
                  ThemeModel.darkTheme(),
              onChanged: (value) {
                Provider.of<ThemeModel>(context, listen: false).toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
