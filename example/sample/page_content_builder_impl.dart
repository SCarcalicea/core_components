import 'package:fire_core_components/fire_core_components.dart';
import 'screens/dashboard.dart';
import 'screens/debts.dart';
import 'screens/expenses.dart';
import 'screens/investments.dart';
import 'screens/net_worth.dart';


class PageContentBuilderImpl extends PageContentBuilderInterface {

  PageContentBuilderImpl() {
    selectedIndex = 1;
    selectedWidget = Expenses();
  }

  @override
  void handleScreenChanged(int selectedScreen) {
    switch (selectedScreen) {
      case 0:
        selectedWidget = Investments();
        case 1:
          selectedWidget =  Expenses();
        case 2:
          selectedWidget =  Dashboard();
        case 3:
          selectedWidget =  NetWorth();
        case 4:
          selectedWidget =  Debts();
        default:
          selectedWidget =  Dashboard();
      }

      selectedIndex = selectedScreen;
      notifyListeners();
  }

}