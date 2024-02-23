import 'package:fire_core_components/src/widgets/common/buttons/filter_by_period_buttons.dart';
import 'package:fire_core_components/src/widgets/common/scrollable_scaffold.dart';
import 'package:fire_core_components/src/widgets/common/investment_expense_summary.dart';
import 'package:flutter/material.dart';

class Debts extends StatefulWidget {
  const Debts({super.key});

  @override
  State<Debts> createState() => _Debts();
}

class _Debts extends State<Debts> {
  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
      leading: const Icon(Icons.menu),
      title: Text("Debts"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: Container(color: Theme.of(context).primaryColor),
      bottomBarWidget: FilterByPeriodButtons(
        height: 30,
        monthText: const Text("Month"),
        yearText: const Text("Year"),
        weekText: const Text("Week"),
        mothCallback: () { },
        weekCallback: () { },
        yearCallback: () { },
      ),
      body: [
        Container(
            child: SingleChildScrollView(
                child: Column(children: [
                  InvestmentExpenseSummary(
                      textStyle: TextStyle(fontSize: 10),
                      valueStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      firstText: "Total Debt",
                      firstValue: "3.5k \$",
                      secondText: "Monthly Expenses",
                      secondValue: "5.2k \$"),
                ])))
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Text(
          "Expenses",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}