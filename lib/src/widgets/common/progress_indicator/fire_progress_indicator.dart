import 'package:flutter/material.dart';

/// This widget represents the current progress until FIRE
/// Based in the percentage, the colour of the indicator is red, green or blue.
class FireProgressIndicator extends StatelessWidget {
  final TextStyle? textStyle;
  final String progressPercentageText;
  final double financialIndependenceProgress;
  final double margin;

  FireProgressIndicator({
    this.textStyle,
    this.margin = 20,
    required this.progressPercentageText,
    required this.financialIndependenceProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(margin),
        child: _buildProgressIndicator(
            progressPercentageText, financialIndependenceProgress, margin));
  }

  Widget _buildProgressIndicator(String progressPercentage,
      double financialIndependenceProgress, double margin) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: margin),
          LinearProgressIndicator(
            value: financialIndependenceProgress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              _calculateProgressColor(financialIndependenceProgress),
            ),
          ),
          SizedBox(height: margin),
          FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                progressPercentage,
                style: textStyle,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }

  Color _calculateProgressColor(double progress) {
    if (progress < 0.45) {
      double opacity = (0.45 - progress) * 10;
      return Colors.red.withOpacity(opacity.clamp(0.1, 1.0));
    } else if (progress > 0.55) {
      double opacity = (progress - 0.55) * 10;
      return Colors.green.withOpacity(opacity.clamp(0.1, 1.0));
    } else {
      return Colors.blue;
    }
  }
}
