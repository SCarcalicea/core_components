import 'package:fire_core_components/fire_core_components.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Investments extends StatefulWidget {
  const Investments({super.key});

  @override
  State<Investments> createState() => _Investments();
}

class _Investments extends State<Investments> {
  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
      leading: const Icon(Icons.menu),
      title: Text("Investments"),
      headerExpandedHeight: 0.25,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: Container(
        color: Theme.of(context).primaryColor,
        child: RoundedRectangularButton(
          label: Text("Add Investment"),
          action: () {},
          icon: Icon(null),
        ),
      ),
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
            child: SingleChildScrollView(
                child: Column(children: [
          InvestmentExpenseSummary(
              textStyle: TextStyle(fontSize: 10),
              valueStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              firstText: "Total Invested",
              firstValue: "3.5k \$",
              secondText: "Current value",
              secondValue: "5.2k \$"),
          IncomeExpenseChart(
            pieChartSectionData: [
              PieChartSectionData(
                  color: Colors.purple,
                  value: 60.0,
                  title: "Stock",
                  radius: 20.00),
              PieChartSectionData(
                  color: Colors.blue,
                  value: 40.0,
                  title: "Crypto",
                  radius: 20.00)
            ],
            pieChartSectionDetails: [
              ChartDetail(color: Colors.purple, text: "Stock", isSquare: false),
              ChartDetail(color: Colors.blue, text: "Crypto", isSquare: false),
              ChartDetail(
                  color: Colors.orange, text: "Real estate", isSquare: false),
              ChartDetail(color: Colors.grey, text: "Other", isSquare: false),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                SubcategoryProgressIndicator(
                    description: Text("Stock"),
                    percentage: Text("60%"),
                    percentageValue: 0.60,
                    color: Colors.purple),
                SubcategoryProgressIndicator(
                    description: Text("Crypto"),
                    percentage: Text("40%"),
                    percentageValue: 0.40,
                    color: Colors.blue),
                SubcategoryProgressIndicator(
                    description: Text("Other"),
                    percentage: Text("0%"),
                    percentageValue: 0,
                    color: Colors.purple),
                SubcategoryProgressIndicator(
                    description: Text("Real estate"),
                    percentage: Text("0%"),
                    percentageValue: 0,
                    color: Colors.blue)
              ],
            ),
          ),
          IncomeExpenseListView(
            modelType: InvestmentModel.type,
            investmentModels: buildInvestmentModel(),
          )
        ])))
      ],
    );
  }
}

List<InvestmentModel> buildInvestmentModel() {
  List<InvestmentModel> investmentModel = [];

  for (int i = 0; i < 5; i++) {
    investmentModel.add(InvestmentModel(
        action: () {},
        itemTitle: "Binance",
        itemDetailsLine1: "Initial value: 1.24k \$",
        itemDetailsLine2: "Current value: 1.24k \$"));
  }

  return investmentModel;
}
