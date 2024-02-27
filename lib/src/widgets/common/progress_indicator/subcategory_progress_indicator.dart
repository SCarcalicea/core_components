import 'package:flutter/material.dart';

/// This widget represents the percentage of a subcategory
/// For example: what percentage of expenses is represented by the savings expenses
class SubcategoryProgressIndicator extends StatefulWidget {
  final double margin;
  final double gapSize;
  final Text description;
  final double percentageValue;
  final Text percentage;
  final Color color;

  const SubcategoryProgressIndicator(
      {this.margin = 20,
      this.gapSize = 100,
      required this.description,
      required this.percentage,
      required this.percentageValue,
      required this.color});

  @override
  State<StatefulWidget> createState() => _SecondaryProgressIndicator();
}

class _SecondaryProgressIndicator extends State<SubcategoryProgressIndicator> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width - widget.margin * 2;

    return Container(
      margin: EdgeInsets.only(
          left: widget.margin, right: widget.margin, bottom: widget.margin / 2),
      child: Row(
        children: [
          Container(
            width: width/3,
            child: Row(
              children: [
                Icon(Icons.circle, color: widget.color),
                SizedBox(width: widget.margin),
                widget.description,
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: LinearProgressIndicator(
                    color: widget.color, value: widget.percentageValue),
              ),
              SizedBox(width: widget.margin),
              widget.percentage
            ]),
          )
        ],
      ),
    );
  }
}
