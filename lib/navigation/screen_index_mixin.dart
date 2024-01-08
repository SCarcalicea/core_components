import 'package:flutter/cupertino.dart';

mixin ScreenIndexMixin on StatefulWidget {

  final ScreenIndexWrapper _screenIndexWrapper = ScreenIndexWrapper();

  int get screenIndex => _screenIndexWrapper.screenIndex;

  set screenIndex(int selectedScreen) {
    _screenIndexWrapper.screenIndex = selectedScreen;
  }

}

class ScreenIndexWrapper {
  int screenIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    screenIndex = selectedScreen;
  }
}