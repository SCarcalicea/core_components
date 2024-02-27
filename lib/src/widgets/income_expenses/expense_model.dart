import 'package:flutter/material.dart';

/// Data model for investment list item
class ExpenseModel {
  final bool isExpense;
  final String itemDetails;
  final String itemDate;
  final String itemValue;
  static String type = "EXPENSE";
  final TextStyle? titleStyle;
  final TextStyle? detailsStyle;

  const ExpenseModel(
      {this.titleStyle,
      this.detailsStyle,
      required this.isExpense,
      required this.itemDetails,
      required this.itemDate,
      required this.itemValue});
}
