import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// This widget is a graphical representation, using a chart with details, of expenses, investments, etc
class IncomeExpenseChart extends StatefulWidget {
  final double mainHeight;
  final double margins;
  final double insideGap;
  final double elevation;
  final List<PieChartSectionData> pieChartSectionData;
  final List<Widget> pieChartSectionDetails;

  const IncomeExpenseChart(
      {super.key,
      this.mainHeight = 225,
      this.margins = 20,
      this.insideGap = 20,
      this.elevation = 20,
      required this.pieChartSectionData,
      required this.pieChartSectionDetails});

  @override
  State<IncomeExpenseChart> createState() => _IncomeExpenseChartState();
}

class _IncomeExpenseChartState extends State<IncomeExpenseChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.mainHeight,
      child: Container(
        margin: EdgeInsets.all(widget.margins),
        child: Card(
          elevation: widget.elevation,
          child: Container(
            margin: EdgeInsets.all(widget.margins),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: PieChart(
                        PieChartData(sections: widget.pieChartSectionData)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: widget.insideGap),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.pieChartSectionDetails,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
