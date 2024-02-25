import 'package:dream_book/features/alarm_clock/data/repositories/alarm_clock_repository.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:get/get.dart';

class AlarmClockVM extends GetxController {
  late RxList<AlarmClockEntity> alarmClockList = <AlarmClockEntity>[].obs;
  final AlarmClockRepository alarmClockRepository = AlarmClockRepository();

  @override
  void onInit() async {
    await loadAlarmClockList();
    super.onInit();
  }

  Future<void> loadAlarmClockList() async {
    var list = await alarmClockRepository.getListAlarmClocks();

    alarmClockList.clear();
    alarmClockList.addAll(list);
  }

  Future<void> deleteAlarmClock(String alarmId) async {
    await alarmClockRepository.deleteAlarmClock(alarmId);
    await loadAlarmClockList();
  }
}
