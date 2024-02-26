import 'package:fire_core_components/fire_core_components.dart';
import 'package:flutter/material.dart';

class NetWorth extends StatefulWidget {
  const NetWorth({super.key});

  @override
  State<NetWorth> createState() => _NetWorth();
}

class _NetWorth extends State<NetWorth> {

  @override
  Widget build(BuildContext context) {
    return ScrollableScaffold(
      leading: const Icon(Icons.menu),
      title: Text("Net Worth"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: Container(color: Theme.of(context).primaryColor),
      body: [
        Container(
            child: SingleChildScrollView(
                child: Column(children: [
                  InvestmentExpenseSummary(
                      textStyle: TextStyle(fontSize: 10),
                      valueStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      firstText: "Net Worth",
                      firstValue: "1M \$",
                      secondText: "Debts",
                      secondValue: "500k \$"),
                ]))),
        FireProgressIndicator(
            progressPercentageText: "Financial Independence Progress: 0.5",
            financialIndependenceProgress: 0.5),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: IncomeExpenseListView(
            modelType: InvestmentModel.type,
            investmentModels: buildInvestmentModel(),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: IncomeExpenseListView(
            modelType: InvestmentModel.type,
            investmentModels: buildInvestmentModel(),
          ),
        ),

      ],
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