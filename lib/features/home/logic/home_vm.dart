import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../core/constants/main_tabs.dart';

class HomeVM extends GetxController {
  final pageController = PersistentTabController(initialIndex: 2).obs;

  var activeTab = MainTabs.alarm_clock;
  var currentTabIndex = 2;

  void changeTab(int index) {
    activeTab = _getCurrentTab(index);
    pageController.value.jumpToTab(index);
    currentTabIndex = index;
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.dreams;
      case 1:
        return MainTabs.diary;
      case 2:
        return MainTabs.alarm_clock;
      case 3:
        return MainTabs.music;
      case 4:
        return MainTabs.profile;
      default:
        return MainTabs.alarm_clock;
    }
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.dreams:
        return 0;
      case MainTabs.diary:
        return 1;
      case MainTabs.alarm_clock:
        return 2;
      case MainTabs.music:
        return 3;
      case MainTabs.profile:
        return 4;
      default:
        return 3;
    }
  }
}
