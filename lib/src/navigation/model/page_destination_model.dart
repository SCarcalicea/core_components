import 'package:flutter/material.dart';

/// This object is used for the bottom bar in order to generate the content for thenavigation between pages.
class PageDestinationModel {
  const PageDestinationModel(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}
