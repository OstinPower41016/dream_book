import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/utils/getUniqueId.dart';
import 'package:dream_book/features/alarm_clock/data/repositories/alarm_clock_repository.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/time_picker_vm.dart';
import 'package:get/get.dart';

class AlarmClockEditVM extends GetxController {
  final AlarmClockRepository alarmClockRepository = AlarmClockRepository();
  final AlarmClockVM alarmClockListViewModel = Get.find<AlarmClockVM>();

  Future<void> registerAlarmClock() async {
    int selectedHours =
        Get.find<TimePickerVM>(tag: "timePickerHours").selectedTime.value % 24;
    int selectedMinutes =
        Get.find<TimePickerVM>(tag: "timePickerMinutes").selectedTime.value %
            60;

    DateTime now = DateTime.now();
    DateTime scheduledDateTime =
        DateTime(now.year, now.month, now.day, selectedHours, selectedMinutes);

    if (scheduledDateTime.isBefore(now)) {
      scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
    }

    await alarmClockRepository.setNewAlarmClock(AlarmClockEntity(
        alarmId: getUniqueId().toString(),
        time: scheduledDateTime,
        isEnabled: true));

    await alarmClockListViewModel.loadAlarmClockList();

    serviceLocator<NotificationService>().scheduleNotification(
      id: getUniqueId(),
      scheduledNotificationDateTime: scheduledDateTime,
    );
  }

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final alarmClocks = await alarmClockRepository.getListAlarmClocks();
    return alarmClocks;
  }

  Future<void> updateAlarmClock(AlarmClockEntity alarmClock) async {
    await alarmClockRepository.updateAlarmClock(alarmClock);
  }
}
