import 'package:flutter/material.dart';

/// This widget represents a list item with 3 rows: a title and 2 rows for details
class ExpensesListItem extends StatelessWidget {
  final bool isExpense;
  final Widget itemDetails;
  final Widget itemDate;
  final String itemValue;
  final VoidCallback action;

  const ExpensesListItem({
    required this.isExpense,
    required this.itemDetails,
    required this.itemDate,
    required this.itemValue,
    required this.action,
  });

  @override
  ListTile build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isExpense ? Icons.paid_outlined : Icons.money_off,
        color: isExpense ? Colors.green : Colors.red,
      ),
      onTap: action,
      title: itemDetails,
      subtitle: itemDate,
      trailing: Text(itemValue,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isExpense ? Colors.green : Colors.red)),
    );
  }
}
