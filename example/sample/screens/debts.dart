import 'package:fire_core_components/fire_core_components.dart';
import 'package:fl_chart/fl_chart.dart';
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
      headerWidget: Container(
        color: Theme.of(context).primaryColor,
        child:
        RoundedRectangularButton(
          label: Text("Add Debt"),
          action: () {},
          icon: Icon(null),
        ),
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
                      secondText: "Monthly Payments",
                      secondValue: "5.2k \$"),
                ]))),
        IncomeExpenseChart(
          pieChartSectionData: [
            PieChartSectionData(
                color: Colors.purple,
                value: 70.0,
                title: "INCOME",
                radius: 20.00),
            PieChartSectionData(
                color: Colors.blueAccent,
                value: 30.0,
                title: "DEBT",
                radius: 20.00)
          ],
          pieChartSectionDetails: [
            ChartDetail(color: Colors.purple, text: "INCOME", isSquare: false),
            ChartDetail(color: Colors.blueAccent, text: "DEBT", isSquare: false),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              SubcategoryProgressIndicator(
                  description: Text("INCOME"),
                  percentage: Text("70%"),
                  percentageValue: 0.7,
                  color: Colors.purple),
              SubcategoryProgressIndicator(
                  description: Text("DEBT     "),
                  percentage: Text("30%"),
                  percentageValue: 0.3,
                  color: Colors.blueAccent),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: IncomeExpenseListView(
            modelType: InvestmentModel.type,
            investmentModels: buildInvestmentModel(),
          ),
        )
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

  List<InvestmentModel> buildInvestmentModel() {
    List<InvestmentModel> investmentModel = [];

    for (int i = 0; i < 5; i++) {
      investmentModel.add(InvestmentModel(
          itemTitle: "Binance",
          itemDetailsLine1: "Initial value: 1.24k \$",
          itemDetailsLine2: "Left to pay: 1.04k \$"));
    }

    return investmentModel;
  }
}