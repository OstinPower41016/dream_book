import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/features/alarm_clock/data/sources/local/alarm_clock_storage.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmClockRepository {
  final SharedPreferences storage = serviceLocator<SharedPreferences>();
  final AlarmClockStorage alarmClockStorage = AlarmClockStorage();

  Future<void> setNewAlarmClock(AlarmClockEntity alarmClock) async {
    await alarmClockStorage.saveAlarmClock(alarmClock);
  }

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final alarmClocks = await alarmClockStorage.getListAlarmClocks();
    return alarmClocks;
  }

  Future<void> deleteAlarmClock(String alarmId) async {
    await alarmClockStorage.deleteAlarmClock(alarmId);
  }
}
