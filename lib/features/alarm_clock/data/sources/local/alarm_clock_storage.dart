import 'dart:async';
import 'dart:convert';

import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmClockStorage {
  final SharedPreferences storage = serviceLocator<SharedPreferences>();

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final String? alarmClocksJson = storage.getString("alarm_clocks");

    if (alarmClocksJson == null) {
      return [];
    }

    final List<dynamic> decodedJson = jsonDecode(alarmClocksJson);

    return decodedJson
        .map((json) => AlarmClockEntity.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveAlarmClock(AlarmClockEntity alarmClock) async {
    final String? alarmClocksJson = storage.getString("alarm_clocks");

    List<Map<String, dynamic>> alarmClocksMap = [];

    if (alarmClocksJson != null) {
      final decodedData = jsonDecode(alarmClocksJson);
      if (decodedData is List<dynamic>) {
        alarmClocksMap = decodedData.cast<Map<String, dynamic>>();
      }
    }

    alarmClocksMap.add(alarmClock.toJson());

    await storage.setString("alarm_clocks", jsonEncode(alarmClocksMap));
  }

  Future<void> deleteAlarmClock(String alarmId) async {
    final String? alarmClocksJson = storage.getString("alarm_clocks");

    if (alarmClocksJson == null) {
      return;
    }

    final List<dynamic> decodedJson = jsonDecode(alarmClocksJson);
    var listAlarmClocks = decodedJson
        .map((json) => AlarmClockEntity.fromJson(json as Map<String, dynamic>))
        .where((element) => element.alarmId != alarmId)
        .toList();

    await storage.setString("alarm_clocks", jsonEncode(listAlarmClocks));
  }
}
