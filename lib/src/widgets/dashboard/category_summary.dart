import 'package:flutter/material.dart';

/// This widget has an icon and underneath two lines of text, basically a summary for each category.
class CategorySummary extends StatelessWidget {
  final Icon icon;
  final String labelText;
  final double value;
  final String currency;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final double elevation;
  final double gapSize;
  final double margin;

  CategorySummary(
      {this.labelStyle,
      this.valueStyle,
        this.elevation = 0,
        this.gapSize = 10,
        this.margin = 20,
      required this.icon,
      required this.labelText,
      required this.currency,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(margin),
        child: Card(
            elevation: elevation,
            child: Container(
              margin: EdgeInsets.all(margin),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: gapSize),
                    icon,
                    SizedBox(height: gapSize * 2),
                    Text(labelText, style: labelStyle),
                    Text(currency + value.toString(), style: valueStyle),
                    SizedBox(height: gapSize),
                  ]),
            )),
      ),
    );
  }
}