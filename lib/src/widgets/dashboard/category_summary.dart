import 'package:flutter/material.dart';

/// This widget has an icon and underneath two lines of text, basically a summary for each category.
class CategorySummary {
  Icon icon;
  String labelText;
  double value;
  String currency;
  TextStyle? labelStyle;
  TextStyle? valueStyle;

  CategorySummary(
      {this.labelStyle,
      this.valueStyle,
      required this.icon,
      required this.labelText,
      required this.currency,
      required this.value});

  Widget buildCategorySummary(double elevation, double gapSize, double margin) {
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
