import 'package:fire_core_components/fire_core_components.dart';
import 'package:fire_core_components/src/theme/theme_switcher.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  bool changeAppBar = false;
  ThemeSwitcher themeSwitcher = ThemeSwitcher();
  Summary summary = Summary(
      labelStyle: TextStyle(fontSize: 10),
      valueStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      currentBalance: 10000.0,
      fireAmount: 1000000.0,
      netWorth: 1000.0,
      currency: "\$");

  FireProgressIndicator progressIndicator = FireProgressIndicator(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
        leading: const Icon(Icons.menu),
        title: Text("Dashboard"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
        headerWidget: Container(color: Theme.of(context).primaryColor),
        bottomBarWidget: FilterByPeriod(
          height: 30,
          monthText: const Text("Month"),
          yearText: const Text("Year"),
          weekText: const Text("Week"),
          mothCallback: () {},
          weekCallback: () {},
          yearCallback: () {},
        ),
        body: [
          Container(
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: Row(children: [
                                const Text('Change AppBar'),
                                Switch(
                                    value: changeAppBar,
                                    onChanged: (value) => setState(() {
                                          changeAppBar = value;
                                        })),
                              ]))),
                      SizedBox(height: 10),
                      themeSwitcher.switchTheme(context),
                    ],
                  ),
                  SizedBox(height: 10),
                  summary.buildSummary("CURRENT BALANCE", "F.I.R.E AMOUNT",
                      "NET WORTH", 20.0, 20.0, 20.0),
                  SizedBox(height: 10),
                  Divider(),
                  progressIndicator.buildProgressIndicator(
                      "Financial Independence Progress: 0.4", 0.4, 20),
                  progressIndicator.buildProgressIndicator(
                      "Financial Independence Progress: 0.5", 0.5, 20),
                  progressIndicator.buildProgressIndicator(
                      "Financial Independence Progress: 0.8", 0.8, 20),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Testing 1",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Testing 1",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Testing 1",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Testing 1",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                    ],
                  )
                ],
              ),
            )
            ),
          )
        ]
    );
  }
}
