import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/features/alarm_clock/data/repositories/alarm_clock_repository.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_list_vm.dart';
import 'package:dream_book/shared/constants/days_of_week.dart';
import 'package:get/get.dart';

class AlarmClockItemVM extends GetxController {
  final AlarmClockRepository alarmClockRepository = AlarmClockRepository();
  final Rx<AlarmClockEntity> alarmClock;
  final AlarmClockListVM alarmClockListVM = Get.find<AlarmClockListVM>();
  final notificationService = serviceLocator<NotificationService>();

  AlarmClockItemVM({required this.alarmClock});

  void changeIsEnabledTime(bool value) async {
    AlarmClockEntity updatedAlarmClock =
        alarmClock.value.copyWith(isEnabled: value);

    alarmClock.value = updatedAlarmClock;
    await _updateAlarmClock(updatedAlarmClock);

    if (value) {
      await notificationService.scheduleNotification(
          scheduledNotificationDateTime: alarmClock.value.time,
          id: alarmClock.value.alarmId);
    } else {
      await notificationService.deleteNotification(alarmClock.value.alarmId);
    }
  }

  Future<void> updateDaysRepeat(DaysOfWeek day, bool checked) async {
    var updatedAlarmClock = alarmClock.value.copyWith(
      listForRepeat: alarmClock.value.listForRepeat.copyWith(
        {day: checked},
      ),
    );

    alarmClock.value = updatedAlarmClock;
    await _updateAlarmClock(updatedAlarmClock);
  }

  Future<void> _updateAlarmClock(AlarmClockEntity alarmClock) async {
    await alarmClockRepository.updateAlarmClock(alarmClock);
    await alarmClockListVM.loadAlarmClockList();
  }
}
