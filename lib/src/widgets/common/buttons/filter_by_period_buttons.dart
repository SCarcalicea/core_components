import 'package:fire_core_components/src/widgets/common/buttons/rounded_rectangular_button.dart';
import 'package:flutter/material.dart';

/// This widget represents a row of rounded rectangular buttons.
class FilterByPeriodButtons extends StatelessWidget {
  final double height;
  final VoidCallback weekCallback;
  final Text weekText;
  final VoidCallback mothCallback;
  final Text monthText;
  final VoidCallback yearCallback;
  final Text yearText;

  const FilterByPeriodButtons({
    super.key,
    required this.height,
    required this.weekCallback,
    required this.mothCallback,
    required this.yearCallback,
    required this.weekText,
    required this.monthText,
    required this.yearText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          child: RoundedRectangularButton(
            action: weekCallback,
            label: weekText,
            icon: Icon(Icons.view_week),
          ),
        ),
        SizedBox(
          height: height,
          child: RoundedRectangularButton(
            action: mothCallback,
            label: monthText,
            icon: Icon(Icons.calendar_view_month),
          ),
        ),
        SizedBox(
          height: height,
          child: RoundedRectangularButton(
            action: yearCallback,
            label: yearText,
            icon: Icon(Icons.calendar_month),
          ),
        ),
      ],
    );
  }
}
