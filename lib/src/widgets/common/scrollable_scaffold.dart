import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

/// This widget represents the body of a page which contains an inward rounded app bar
/// The inward rounded appbar can have multiple widgets and actions
/// The whole body of the widget is scrollable hence no scrollable widgets allowed
class ScrollableScaffold extends StatefulWidget {
  final Widget? leading;
  final Widget? bottomBarWidget;
  final List<Widget>? actions;
  final Widget? headerWidget;
  final double headerExpandedHeight;
  final double curvedBodyRadius;
  final Widget title;
  final List<Widget> body;

  const ScrollableScaffold(
      {this.leading,
      this.bottomBarWidget,
      this.actions,
      this.headerWidget,
      this.headerExpandedHeight = 0.18,
      this.curvedBodyRadius = 40,
      required this.title,
      required this.body});

  @override
  State<StatefulWidget> createState() => _ScrollableScaffold();
}

class _ScrollableScaffold extends State<ScrollableScaffold> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      centerTitle: true,
      alwaysShowLeadingAndAction: true,
      alwaysShowTitle: true,
      fullyStretchable: true,
      headerExpandedHeight: widget.headerExpandedHeight,
      curvedBodyRadius: widget.curvedBodyRadius,
      appBarColor: Theme.of(context).primaryColor,
      leading: widget.leading,
      title: widget.title,
      headerBottomBar: widget.bottomBarWidget,
      actions: widget.actions,
      headerWidget: headerWidget(context),
      body: widget.body,
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(child: widget.headerWidget),
    );
  }
}
