import 'package:flutter/material.dart';

class ExpensesListItem extends StatelessWidget {
  final bool isExpense;
  final Widget itemDetails;
  final Widget itemDate;
  final String itemValue;

  const ExpensesListItem({
    required this.isExpense,
    required this.itemDetails,
    required this.itemDate,
    required this.itemValue,
  });

  @override
  ListTile build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isExpense ? Icons.paid_outlined : Icons.money_off,
        color: isExpense
            ? Colors.green
            : Colors.red,
      ),
      title: itemDetails,
      subtitle: itemDate,
      trailing: Text(itemValue),
    );
  }
}
