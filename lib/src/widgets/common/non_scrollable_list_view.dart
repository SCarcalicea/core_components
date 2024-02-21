import 'package:fire_core_components/src/widgets/investments/list/investment_list_item.dart';
import 'package:flutter/material.dart';

import '../income_expenses/list/expense_list_item.dart';
import '../income_expenses/list/expense_model.dart';
import '../investments/list/investment_model.dart';

class NonScrollableListView extends StatelessWidget {
  final double margin;
  final String modelType;
  final List<ExpenseModel>? expenseModels;
  final List<InvestmentModel>? investmentModels;

  const NonScrollableListView(
      {super.key,
      this.margin = 20,
      this.expenseModels,
      this.investmentModels,
      required this.modelType});

  @override
  Widget build(BuildContext context) {

    int itemCount = modelType == ExpenseModel.type ?
        expenseModels!.length :
        investmentModels!.length;

    return ListView.builder(
        padding: EdgeInsets.only(top: 0, left: margin, right: margin),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          switch (modelType) {
            case "EXPENSE":

              ExpenseModel model = expenseModels![index];
              return Card(
                  child: ExpensesListItem(
                      isExpense: model.isExpense,
                      itemDetails: Text(model.itemDetails),
                      itemDate: Text(model.itemDate),
                      itemValue: model.itemValue));

            case "INVESTMENT":

              InvestmentModel model = investmentModels![index];
              return Card(
                  child: InvestmentListItem(
                    itemTitle: Text(model.itemTitle),
                    itemDetails2Lines: Column(
                      children: [
                        Text(model.itemDetailsLine1),
                        Text(model.itemDetailsLine2),
                      ],
                    ),
                  ));
          }

          return null;

        });
  }
}