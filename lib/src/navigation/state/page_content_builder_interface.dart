import 'package:flutter/material.dart';

/// This provider interface is used in order to switch between screens using the bottom bar buttons.
abstract class PageContentBuilderInterface extends ChangeNotifier {
  int selectedIndex = 0;
  Widget selectedWidget = Container();

  int get selectedIndexGetter => selectedIndex;
  Widget get selectedWidgetGetter => selectedWidget;

  void handleScreenChanged(int selectedScreen);
}
