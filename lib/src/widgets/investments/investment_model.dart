import 'package:flutter/material.dart';

/// Data model for investment list item
class InvestmentModel {
  final String itemTitle;
  final String itemDetailsLine1;
  final String itemDetailsLine2;
  static String type = "INVESTMENT";
  final TextStyle? titleStyle;
  final TextStyle? detailsStyle;
  final VoidCallback action;

  const InvestmentModel(
      {this.titleStyle,
      this.detailsStyle,
      required this.action,
      required this.itemTitle,
      required this.itemDetailsLine1,
      required this.itemDetailsLine2});
}
