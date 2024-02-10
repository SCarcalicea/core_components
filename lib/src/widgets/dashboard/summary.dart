import 'package:flutter/material.dart';

class Summary {
  double currentBalance;
  double fireAmount;
  double netWorth;
  String currency;
  TextStyle? labelStyle;
  TextStyle? valueStyle;

  Summary(
      {this.labelStyle,
      this.valueStyle,
      required this.currentBalance,
      required this.fireAmount,
      required this.netWorth,
      required this.currency});

  Widget buildSummary(String currentBalanceLabel, String fireAmountLabel,
      String netWorthLabel, double elevation, double gapSize, double margin) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: SizedBox(
        width: double.infinity,
        child: Card(
            elevation: elevation,
            child: Container(
              margin: EdgeInsets.all(margin),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentBalanceLabel, style: labelStyle),
                    Text(currency + currentBalance.toString(),
                        style: valueStyle),
                    SizedBox(height: gapSize),
                    Text(fireAmountLabel, style: labelStyle),
                    Text(currency + fireAmount.toString(), style: valueStyle),
                    SizedBox(height: gapSize),
                    Text(netWorthLabel, style: labelStyle),
                    Text(currency + netWorth.toString(), style: valueStyle)
                  ]),
            )),
      ),
    );
  }
}
