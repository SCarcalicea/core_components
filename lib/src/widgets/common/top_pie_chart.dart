import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TopPieChart extends StatefulWidget {

  final double mainHeight;
  final double margins;
  final double elevation;
  final List<PieChartSectionData> pieChartSectionData;
  final List<Widget> pieChartSectionDetails;

  const TopPieChart({
    super.key,
    this.mainHeight = 225,
    this.margins = 20,
    this.elevation = 20,
    required this.pieChartSectionData,
    required this.pieChartSectionDetails
  });

  @override
  State<TopPieChart> createState() => _TopPieChartState();
}

class _TopPieChartState extends State<TopPieChart> {
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
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: PieChart(
                      PieChartData(
                      sections: widget.pieChartSectionData)),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pieChartSectionDetails,
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
