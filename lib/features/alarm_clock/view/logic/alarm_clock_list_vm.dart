import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/utils/getUniqueId.dart';
import 'package:dream_book/features/alarm_clock/data/repositories/alarm_clock_repository.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_repeat_by_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/time_picker_vm.dart';
import 'package:get/get.dart';

class AlarmClockListVM extends GetxController {
  late RxList<AlarmClockEntity> alarmClockList = <AlarmClockEntity>[].obs;
  final AlarmClockRepository alarmClockRepository = AlarmClockRepository();
  final notificationService = serviceLocator<NotificationService>();

  @override
  void onInit() async {
    await loadAlarmClockList();
    super.onInit();
  }

  Future<void> registerAlarmClock() async {
    int selectedHours =
        Get.find<TimePickerVM>(tag: "timePickerHours").selectedTime.value % 24;
    int selectedMinutes =
        Get.find<TimePickerVM>(tag: "timePickerMinutes").selectedTime.value %
            60;
    int alarmClockId = getUniqueId();

    DateTime now = DateTime.now();
    DateTime scheduledDateTime =
        DateTime(now.year, now.month, now.day, selectedHours, selectedMinutes);

    if (scheduledDateTime.isBefore(now)) {
      scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
    }

    await alarmClockRepository.setNewAlarmClock(AlarmClockEntity(
        alarmId: alarmClockId,
        time: scheduledDateTime,
        isEnabled: true,
        listForRepeat: AlarmClockRepeatByEntity()));

    await _setAlarmClockTimeNotification(alarmClockId, scheduledDateTime);

    await loadAlarmClockList();
  }

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final alarmClocks = await alarmClockRepository.getListAlarmClocks();
    return alarmClocks;
  }

  Future<void> loadAlarmClockList() async {
    var list = await alarmClockRepository.getListAlarmClocks();

    alarmClockList.clear();
    alarmClockList.addAll(list);
  }

  Future<void> deleteAlarmClock(int alarmId) async {
    await alarmClockRepository.deleteAlarmClock(alarmId);
    await _deleteAlarmClockNotification(alarmId);
    await loadAlarmClockList();
  }

  Future<void> _setAlarmClockTimeNotification(int id, DateTime time) async {
    await notificationService.scheduleNotification(
      id: id,
      scheduledNotificationDateTime: time,
    );
  }

  Future<void> _deleteAlarmClockNotification(int id) async {
    await notificationService.deleteNotification(id);
  }
}
