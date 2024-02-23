import 'package:flutter/material.dart';

/// This widget represents a single rounded rectangular button.
class RoundedRectangularButton extends StatelessWidget {
  final double cornerRadius;
  final Widget label;
  final Icon icon;
  final VoidCallback action;

  const RoundedRectangularButton(
      {this.cornerRadius = 0.6,
      required this.label,
      required this.action,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: () {},
      icon: icon,
      label: label,
    );
  }
}
