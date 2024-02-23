import 'package:fire_core_components/src/widgets/common/buttons/filter_by_period_buttons.dart';
import 'package:fire_core_components/src/widgets/common/chat/chart_detail.dart';
import 'package:fire_core_components/src/widgets/common/chat/income_expense_chart.dart';
import 'package:fire_core_components/src/widgets/common/income_expense_list_view.dart';
import 'package:fire_core_components/src/widgets/common/investment_expense_summary.dart';
import 'package:fire_core_components/src/widgets/common/progress_indicator/subcategory_progress_indicator.dart';
import 'package:fire_core_components/src/widgets/common/scrollable_scaffold.dart';
import 'package:fire_core_components/src/widgets/income_expenses/expense_model.dart';
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
                      firstText: "Total Income",
                      firstValue: "3.5k \$",
                      secondText: "Total Expense",
                      secondValue: "5.2k \$"),
                  IncomeExpenseChart(
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
                      ChartDetail(color: Colors.green, text: "TEST", isSquare: false),
                      ChartDetail(color: Colors.blue, text: "TEST", isSquare: false),
                      ChartDetail(color: Colors.red, text: "TEST", isSquare: false),
                      ChartDetail(color: Colors.blue, text: "TEST", isSquare: false),
                      ChartDetail(color: Colors.red, text: "TEST", isSquare: false),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        SubcategoryProgressIndicator(
                            description: Text("Needs   "),
                            percentage: Text("13%"),
                            percentageValue: 0.13,
                            color: Colors.green),
                        SubcategoryProgressIndicator(
                            description: Text("Wants   "),
                            percentage: Text("67%"),
                            percentageValue: 0.67,
                            color: Colors.blue),
                        SubcategoryProgressIndicator(
                            description: Text("Savings"),
                            percentage: Text("20%"),
                            percentageValue: 0.20,
                            color: Colors.red),
                      ],
                    ),
                  ),
                  IncomeExpenseListView(
                    modelType: ExpenseModel.type,
                    expenseModels: buildExpenseModel(),
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