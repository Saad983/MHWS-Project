import 'package:mhws/view/utils/export_all.dart';

class NavBarController extends GetxController {
  int tabIndex = 2;

  void changeTabIndex(int index) {
    if (tabIndex != index) {
      tabIndex = index;
      update();
    }
  }
}
