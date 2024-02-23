import 'package:flutter/material.dart';

/// Summary for the current category
/// Usually used for totals of current values
class InvestmentExpenseSummary extends StatefulWidget {
  final String firstText;
  final String firstValue;

  final String secondText;
  final String secondValue;

  final TextStyle? textStyle;
  final TextStyle? valueStyle;

  final double topMargin;
  final double gapSize;

  const InvestmentExpenseSummary({
    super.key,
    this.textStyle,
    this.valueStyle,
    this.topMargin = 20,
    this.gapSize = 200,
    required this.firstText,
    required this.firstValue,
    required this.secondText,
    required this.secondValue,
  });

  @override
  State<InvestmentExpenseSummary> createState() =>
      _InvestmentExpenseSummaryState();
}

class _InvestmentExpenseSummaryState extends State<InvestmentExpenseSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topMargin),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Text(widget.firstText, style: widget.textStyle),
          Text(widget.firstValue, style: widget.valueStyle),
        ]),
        SizedBox(width: widget.gapSize),
        Column(children: [
          Text(widget.secondText, style: widget.textStyle),
          Text(widget.secondValue, style: widget.valueStyle),
        ])
      ]),
    );
  }
}
