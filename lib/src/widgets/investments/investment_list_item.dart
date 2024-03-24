import 'package:flutter/material.dart';

/// This widget represents a list item with 3 rows: a title and 2 rows for details
class InvestmentListItem extends StatelessWidget {
  final Widget itemTitle;
  final Column itemDetails2Lines;
  final VoidCallback action;

  const InvestmentListItem({
    super.key,
    required this.itemTitle,
    required this.itemDetails2Lines,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Center(child: itemTitle),
        onTap: action,
        subtitle: itemDetails2Lines);
  }
}
