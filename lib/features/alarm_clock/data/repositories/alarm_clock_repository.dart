import 'package:dream_book/features/alarm_clock/data/sources/local/alarm_clock_storage.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';

class AlarmClockRepository {
  final AlarmClockStorage _alarmClockStorage = AlarmClockStorage();

  Future<void> setNewAlarmClock(AlarmClockEntity alarmClock) async {
    await _alarmClockStorage.saveAlarmClock(alarmClock);
  }

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final alarmClocks = await _alarmClockStorage.getListAlarmClocks();
    return alarmClocks;
  }

  Future<void> deleteAlarmClock(String alarmId) async {
    await _alarmClockStorage.deleteAlarmClock(alarmId);
  }

  Future<void> updateAlarmClock(AlarmClockEntity alarmClock) async {
    final alarmClocks = await getListAlarmClocks();
    final updatedAlarmClocksIdx = alarmClocks
        .indexWhere((element) => element.alarmId == alarmClock.alarmId);

    if (updatedAlarmClocksIdx != -1) {
      alarmClocks[updatedAlarmClocksIdx] = alarmClock;
      await _alarmClockStorage.updateAlarmClocks(alarmClocks);
    }
  }
}
