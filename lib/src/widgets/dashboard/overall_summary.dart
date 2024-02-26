import 'package:flutter/material.dart';

/// This widget represents a card with 6 lines of text
/// You can define two styles which are divided amongst the 6 lines
/// First line has the 'labelStyle', the second line has the 'valueStyle' and so on
class OverallSummary extends StatelessWidget {
  final double currentBalance;
  final double fireAmount;
  final double netWorth;
  final String currency;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final String currentBalanceLabel;
  final String fireAmountLabel;
  final String netWorthLabel;
  final double elevation;
  final double gapSize;
  final double margin;

  OverallSummary(
      {this.labelStyle,
      this.valueStyle,
      this.elevation = 20,
      this.gapSize = 20,
      this.margin = 20,
      required this.currentBalance,
      required this.fireAmount,
      required this.netWorth,
      required this.currency,
      required this.currentBalanceLabel,
      required this.fireAmountLabel,
      required this.netWorthLabel});

  @override
  Widget build(BuildContext context) {
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
