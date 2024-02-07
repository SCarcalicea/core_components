import 'package:fire_core_components/src/widgets/common/app_bar_model.dart';
import 'package:flutter/material.dart';

class AppBarFactory {

  /// Builds a generic AppBar widget using a model
  ///
  /// It can have a shape, actions and a height. If no height is provided then 75 is the default.
  AppBar genericAppBar(AppBarModel model) {
    return AppBar(
      centerTitle: true,
      title: Container(
          padding: const EdgeInsets.all(10),
          child: model.title
      ),
      flexibleSpace: Container (
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: model.gradientProportions,
                colors: model.gradientColors
            )
        ),
      ),
      shape: model.shapeBorder,
      toolbarHeight: model.height,
      actions: model.actions,
      automaticallyImplyLeading: false,
    );
  }
}