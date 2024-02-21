import 'package:flutter/material.dart';

class InvestmentListItem extends StatelessWidget {
  final Widget itemTitle;
  final Column itemDetails2Lines;

  const InvestmentListItem({
    super.key,
    required this.itemTitle,
    required this.itemDetails2Lines,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(child: itemTitle),
      subtitle: itemDetails2Lines
    );
  }
}