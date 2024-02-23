import 'package:flutter/material.dart';

/// Before the implementation of ScrollableScaffold this widget was used in order to build the app bar.
@Deprecated('Use ScrollableScaffold instead')
class AppBarModel {
  final BuildContext context;
  final Text title;
  final String profileTitle;
  final List<double> gradientProportions;
  final List<Color> gradientColors;
  final ShapeBorder? shapeBorder;
  final List<Widget>? actions;
  final double height;
  final double margin;
  final PreferredSizeWidget? bottomButtons;

  /// Builds a model for the AppBarFactory
  ///
  /// The list of actions can be dynamically built for user management or for the three dot menu.
  const AppBarModel.of(
      {this.shapeBorder,
      this.actions,
      this.height = 75,
      this.margin = 10,
      this.bottomButtons,
      required this.context,
      required this.title,
      required this.profileTitle,
      required this.gradientColors,
      required this.gradientProportions});
}
