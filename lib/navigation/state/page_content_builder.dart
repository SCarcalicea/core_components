import 'package:flutter/material.dart';

import '../destination_usecase/screens/dashboard.dart';
import '../destination_usecase/screens/debts.dart';
import '../destination_usecase/screens/expenses.dart';
import '../destination_usecase/screens/investments.dart';
import '../destination_usecase/screens/net_worth.dart';

class PageContentBuilder extends ChangeNotifier {

  int _selectedIndex = 0;
  Widget _selectedWidget = const Dashboard();

  int get selectedIndex => _selectedIndex;
  Widget get selectedWidget => _selectedWidget;

  void handleScreenChanged(int selectedScreen) {

    switch (selectedScreen) {
      case 0:
        _selectedWidget = const Investments();
      case 1:
        _selectedWidget =  const Expenses();
      case 2:
        _selectedWidget =  const Dashboard();
      case 3:
        _selectedWidget =  const NetWorth();
      case 4:
        _selectedWidget =  const Debts();
      default:
        _selectedWidget =  const Dashboard();
    }

    _selectedIndex = selectedScreen;
    notifyListeners();
  }
}