import 'package:flutter/material.dart';

abstract class PageContentBuilderInterface extends ChangeNotifier {
  int selectedIndex = 0;
  Widget selectedWidget = Container();

  int get selectedIndexGetter => selectedIndex;
  Widget get selectedWidgetGetter => selectedWidget;

  void handleScreenChanged(int selectedScreen);
}
