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
  OverallSummary summary = OverallSummary(
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
        bottomBarWidget: FilterByPeriodButtons(
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
                  summary.buildSummary("CURRENT BALANCE", "F.I.R.E AMOUNT",
                      "NET WORTH", 20.0, 20.0, 20.0),
                  Divider(),
                  progressIndicator.buildProgressIndicator(
                      "Financial Independence Progress: 0.8", 0.8, 20),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Investments",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Expenses",
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
                              labelText: "Net Worth",
                              currency: "\$",
                              value: 10000.0)
                          .buildCategorySummary(20, 20, 20),
                      CategorySummary(
                              labelStyle: TextStyle(fontSize: 20),
                              valueStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              icon: Icon(Icons.ac_unit),
                              labelText: "Debts",
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
