import 'package:fire_core_components/src/widgets/investments/investment_list_item.dart';
import 'package:flutter/material.dart';

import '../income_expenses/expense_list_item.dart';
import '../income_expenses/expense_model.dart';
import '../investments/investment_model.dart';

/// This widget represents a list of widgets and uses a data model for each item
/// The list is not scrollable
class IncomeExpenseListView extends StatelessWidget {
  final double margin;
  final String modelType;
  final List<ExpenseModel>? expenseModels;
  final List<InvestmentModel>? investmentModels;
  final Color? itemColor;
  final double? elevation;

  const IncomeExpenseListView(
      {super.key,
      this.margin = 20,
      this.itemColor,
      this.elevation = 20,
      this.expenseModels,
      this.investmentModels,
      required this.modelType});

  @override
  Widget build(BuildContext context) {
    int itemCount = modelType == ExpenseModel.type
        ? expenseModels!.length
        : investmentModels!.length;

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
                  surfaceTintColor: itemColor,
                  elevation: elevation,
                  child: ExpensesListItem(
                      isExpense: model.isExpense,
                      itemDetails:
                          Text(model.itemDetails, style: model.titleStyle),
                      itemDate: Text(model.itemDate, style: model.detailsStyle),
                      itemValue: model.itemValue));

            case "INVESTMENT":
              InvestmentModel model = investmentModels![index];
              return Card(
                  surfaceTintColor: itemColor,
                  child: InvestmentListItem(
                    itemTitle: Text(model.itemTitle, style: model.titleStyle),
                    itemDetails2Lines: Column(
                      children: [
                        Text(model.itemDetailsLine1, style: model.detailsStyle),
                        Text(model.itemDetailsLine2, style: model.detailsStyle),
                      ],
                    ),
                  ));
          }

          return null;
        });
  }
}
