import 'package:flutter/material.dart';

class TopSummary extends StatefulWidget {

  final String firstText;
  final String firstValue;

  final String secondText;
  final String secondValue;

  final TextStyle? textStyle;
  final TextStyle? valueStyle;

  final double topMargin;
  final double gapSize;

  const TopSummary({
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
  State<TopSummary> createState() => _TopSummaryState();
}

class _TopSummaryState extends State<TopSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                children: [
                  Text(widget.firstText, style: widget.textStyle),
                  Text(widget.firstValue, style: widget.valueStyle),
                ]
            ),
            SizedBox(width: widget.gapSize),
            Column(
                children: [
                  Text(widget.secondText, style: widget.textStyle),
                  Text(widget.secondValue, style: widget.valueStyle),
                ]
            )
          ]
      ),
    );
  }
}