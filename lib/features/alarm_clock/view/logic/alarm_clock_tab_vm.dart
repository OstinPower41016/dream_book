import 'package:get/get.dart';

enum TabOptions { list_alarm_clock, edit_alarm_clock, settings }

class AlarmClockTabVM extends GetxController {
  var activeTab = TabOptions.list_alarm_clock.obs;

  void changeActiveTab(TabOptions tabOption) {
    activeTab.value = tabOption;
  }
}
