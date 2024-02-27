import 'package:get/get.dart';

class AlarmClockItemVM extends GetxController {
  final RxBool isEnabled;
  final String alarmId;

  AlarmClockItemVM({required this.isEnabled, required this.alarmId});

  void changeIsEnabled(bool value) {
    isEnabled.value = value;
  }
}
