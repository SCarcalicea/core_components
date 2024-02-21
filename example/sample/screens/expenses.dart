import 'package:fire_core_components/src/widgets/common/buttons/filter_by_period.dart';
import 'package:fire_core_components/src/widgets/common/progress_indicator/indicator.dart';
import 'package:fire_core_components/src/widgets/common/non_scrollabe_list_view.dart';
import 'package:fire_core_components/src/widgets/common/scrollable_scaffold.dart';
import 'package:fire_core_components/src/widgets/common/progress_indicator/secondary_progress_indicator.dart';
import 'package:fire_core_components/src/widgets/common/top_pie_chart.dart';
import 'package:fire_core_components/src/widgets/income_expenses/list/expense_model.dart';
import 'package:fire_core_components/src/widgets/income_expenses/top_summary.dart';
import 'package:fire_core_components/src/widgets/investments/list/investment_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
      leading: const Icon(Icons.menu),
      title: Text("Expenses"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: Container(color: Theme.of(context).primaryColor),
      bottomBarWidget: FilterByPeriod(
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
                  TopSummary(
                      textStyle: TextStyle(fontSize: 10),
                      valueStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      firstText: "Total Income",
                      firstValue: "3.5k \$",
                      secondText: "Total Expense",
                      secondValue: "5.2k \$"),
                  TopPieChart(
                    pieChartSectionData: [
                      PieChartSectionData(
                          color: Colors.green,
                          value: 35.0,
                          title: "TEST 1",
                          radius: 20.00),
                      PieChartSectionData(
                          color: Colors.blue,
                          value: 30.0,
                          title: "TEST",
                          radius: 20.00),
                      PieChartSectionData(
                          color: Colors.red, value: 45.0, title: "TEST", radius: 20.00)
                    ],
                    pieChartSectionDetails: [
                      Indicator(color: Colors.green, text: "TEST", isSquare: false),
                      Indicator(color: Colors.blue, text: "TEST", isSquare: false),
                      Indicator(color: Colors.red, text: "TEST", isSquare: false),
                      Indicator(color: Colors.blue, text: "TEST", isSquare: false),
                      Indicator(color: Colors.red, text: "TEST", isSquare: false),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        SecondaryProgressIndicator(
                            description: Text("Needs   "),
                            percentage: Text("13%"),
                            percentageValue: 0.13,
                            color: Colors.green),
                        SecondaryProgressIndicator(
                            description: Text("Wants   "),
                            percentage: Text("67%"),
                            percentageValue: 0.67,
                            color: Colors.blue),
                        SecondaryProgressIndicator(
                            description: Text("Savings"),
                            percentage: Text("20%"),
                            percentageValue: 0.20,
                            color: Colors.red),
                      ],
                    ),
                  ),
                  NonScrollableListView(
                    modelType: ExpenseModel.type,
                    expenseModels: buildExpenseModel(),
                    investmentModels: buildInvestmentModel(),
                  )
                ]
                )
            )
        )
      ],
    );
  }
}

List<ExpenseModel> buildExpenseModel() {
  List<ExpenseModel> expenseModel = [];

  for (int i = 0; i < 5; i++) {
    expenseModel.add(ExpenseModel(
        isExpense: i / 2 == 0,
        itemDetails: "Saving test",
        itemDate: DateUtils.dateOnly(DateTime.now()).toString(),
        itemValue: "-1.05k \$"));
  }

  return expenseModel;
}

List<InvestmentModel> buildInvestmentModel() {
  List<InvestmentModel> investmentModel = [];

  for (int i = 0; i < 5; i++) {
    investmentModel.add(InvestmentModel(
        itemTitle: "Binance",
        itemDetailsLine1: "Initial value: 1.24k \$",
        itemDetailsLine2: "Current value: 1.24k \$"));
  }

  return investmentModel;
}