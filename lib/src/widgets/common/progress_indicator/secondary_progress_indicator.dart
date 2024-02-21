import 'package:flutter/material.dart';

class SecondaryProgressIndicator extends StatefulWidget {

  final double margin;
  final double gapSize;
  final Text description;
  final double percentageValue;
  final Text percentage;
  final Color color;

  const SecondaryProgressIndicator({
    this.margin = 20,
    this.gapSize = 100,
    required this.description,
    required this.percentage,
    required this.percentageValue,
    required this.color});

  @override
  State<StatefulWidget> createState() => _SecondaryProgressIndicator();
}

class _SecondaryProgressIndicator extends State<SecondaryProgressIndicator> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: widget.margin, right: widget.margin, bottom: widget.margin/2),
      child: SizedBox(
        child: Row(
          children: [
            Icon(Icons.circle, color: widget.color),
            SizedBox(width: widget.margin),
            widget.description,
            SizedBox(width: widget.gapSize),
            Expanded(
              child: LinearProgressIndicator(color: widget.color, value: widget.percentageValue),
            ),
            SizedBox(width: widget.margin),
            widget.percentage
          ],
        ),
      ),
    );

  }

}