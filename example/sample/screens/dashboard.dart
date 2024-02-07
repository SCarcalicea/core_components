import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:fire_core_components/src/theme/theme_switcher.dart';
import 'package:fire_core_components/src/widgets/common/app_bar.dart';
import 'package:fire_core_components/src/widgets/common/app_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  final AppBarFactory appBarFactory = AppBarFactory();

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {

  bool changeAppBar = false;
  ThemeSwitcher themeSwitcher = ThemeSwitcher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: switchAppBar(),
      body: Center(
          child: Column(
            children: [
              const Text('Dashboard screen'),
              Switch(
                  value: changeAppBar,
                  onChanged: (value) => setState(() {
                    changeAppBar = value;
                  })
              ),
              themeSwitcher.switchTheme(context)
            ],
          )
      )
    );
  }

  AppBar switchAppBar () {

    AppBarModel appBarModel1 = AppBarModel.of(
      actions: [
        IconButton(
            icon: Icon(Icons.person),
            onPressed: (){})
      ],
        context: context,
        title: Text("Main AppBar 1",
            style: Provider.of<ThemeModel>(context).currentTheme.textTheme.displayLarge),
        profileTitle: "Sample profile title",
        gradientColors: <Color>[
          Colors.blueAccent,
          Colors.blueAccent,
          Colors.blueAccent,
          Colors.blueAccent
        ],
        gradientProportions: const [
          0.1,
          0.4,
          0.6,
          0.9
        ]);

    AppBarModel appBarModel2 = AppBarModel.of(
        context: context,
        title: Text("Main AppBar 2",
            style: Provider.of<ThemeModel>(context).currentTheme.textTheme.displayLarge),
        profileTitle: "Sample profile title",
        gradientColors: <Color>[
          Colors.black,
          Colors.deepPurple,
          Colors.deepPurpleAccent,
          Colors.deepPurple.shade200
        ],
        gradientProportions: const [
          0.1,
          0.4,
          0.6,
          0.9
        ]);

    if (changeAppBar) {
      return widget.appBarFactory.genericAppBar(appBarModel1);
    } else {
      return widget.appBarFactory.genericAppBar(appBarModel2);
    }
  }
}