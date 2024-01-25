import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher {
  Widget switchTheme(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Text('Dark Mode'),
          Switch(
            value: Provider.of<ThemeModel>(context).currentTheme ==
                ThemeData.dark(),
            onChanged: (value) {
              Provider.of<ThemeModel>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
