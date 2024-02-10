import 'package:dream_book/modules/home/tabs.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeTab = MainTabs.alarm_clock.obs;

  void changeTab(int index) {
    activeTab.value = _getCurrentTab(index);
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
}
