import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: widget.isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: widget.color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        )
      ],
    );
  }
}