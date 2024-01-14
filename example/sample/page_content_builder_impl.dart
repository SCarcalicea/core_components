import 'package:fire_core_components/fire_core_components.dart';
import 'screens/dashboard.dart';
import 'screens/debts.dart';
import 'screens/expenses.dart';
import 'screens/investments.dart';
import 'screens/net_worth.dart';


class PageContentBuilderImpl extends PageContentBuilderInterface {

  PageContentBuilderImpl() {
    selectedIndex = 2;
    selectedWidget = Dashboard();
  }

  @override
  void handleScreenChanged(int selectedScreen) {
    switch (selectedScreen) {
      case 0:
        selectedWidget = const Investments();
        case 1:
          selectedWidget =  const Expenses();
        case 2:
          selectedWidget =  const Dashboard();
        case 3:
          selectedWidget =  const NetWorth();
        case 4:
          selectedWidget =  const Debts();
        default:
          selectedWidget =  const Dashboard();
      }

      selectedIndex = selectedScreen;
      notifyListeners();
  }

}