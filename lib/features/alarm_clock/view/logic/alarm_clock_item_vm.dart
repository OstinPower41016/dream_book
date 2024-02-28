import 'package:dream_book/features/alarm_clock/data/repositories/alarm_clock_repository.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:get/get.dart';

class AlarmClockItemVM extends GetxController {
  final AlarmClockRepository alarmClockRepository = AlarmClockRepository();
  final Rx<AlarmClockEntity> alarmClock;

  AlarmClockItemVM({required this.alarmClock});

  void changeIsEnabledTime(bool value) async {
    AlarmClockEntity updatedAlarmClock = alarmClock.value.copyWith(isEnabled: value);

    alarmClock.value = updatedAlarmClock;
    await alarmClockRepository.updateAlarmClock(updatedAlarmClock);
  }

  Future<void> updateAlarmClock(AlarmClockEntity alarmClock) async {
    await alarmClockRepository.updateAlarmClock(alarmClock);
  }
}