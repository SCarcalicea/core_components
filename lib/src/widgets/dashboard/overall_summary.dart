import 'package:flutter/material.dart';

/// This widget represents a card with 6 lines of text
/// You can define two styles which are divided amongst the 6 lines
/// First line has the 'labelStyle', the second line has the 'valueStyle' and so on
class OverallSummary {
  double currentBalance;
  double fireAmount;
  double netWorth;
  String currency;
  TextStyle? labelStyle;
  TextStyle? valueStyle;

  OverallSummary(
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
