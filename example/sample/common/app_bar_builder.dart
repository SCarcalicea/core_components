import 'package:fire_core_components/fire_core_components.dart';
import 'package:fire_core_components/src/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarBuilder {

  AppBarModel build(BuildContext context, bool noGradient) {
    AppBarModel noGradientAppBar = AppBarModel.of(
        actions: [IconButton(icon: Icon(Icons.person), onPressed: () {})],
        shapeBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(70))
        ),
        bottomButtons: PreferredSize(
          preferredSize: const Size.fromHeight(80), // Adjust the height of the bottom buttons and gap
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for month button
                      },
                      child: const Text('Week'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for week button
                      },
                      child: const Text('Month'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for year button
                      },
                      child: const Text('Year'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        context: context,
        title: Text("Main AppBar 1",
            style: Provider.of<ThemeModel>(context)
                .currentTheme
                .textTheme
                .displayLarge),
        profileTitle: "Sample profile title",
        gradientColors: <Color>[
          Colors.blueAccent,
          Colors.blueAccent,
          Colors.blueAccent,
          Colors.blueAccent
        ],
        gradientProportions: const [0.1, 0.4, 0.6, 0.9]);

    AppBarModel gradientAppBar = AppBarModel.of(
        bottomButtons: PreferredSize(
          preferredSize: const Size.fromHeight(40), // Adjust the height of the bottom buttons and gap
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for month button
                      },
                      child: const Text('Week'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for week button
                      },
                      child: const Text('Month'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for year button
                      },
                      child: const Text('Year'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        context: context,
        title: Text("Main AppBar 2",
            style: Provider.of<ThemeModel>(context)
                .currentTheme
                .textTheme
                .displayLarge),
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

    if (noGradient) {
      return noGradientAppBar;
    } else {
      return gradientAppBar;
    }
  }
}