import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_edit_vm.dart';
import 'package:get/get.dart';

class TimeCardVM extends GetxController {
  var alarmClockEditVM = AlarmClockEditVM();

  final AlarmClockEntity alarmClock;
  final RxBool isEnabled;

  TimeCardVM({required this.alarmClock}) : isEnabled = alarmClock.isEnabled.obs;

  void changeIsEnabledTime(bool value) async {
    isEnabled.value = value;

    AlarmClockEntity updatedAlarmClock = alarmClock.copyWith(isEnabled: value);
    await alarmClockEditVM.updateAlarmClock(updatedAlarmClock);
  }
}
