import 'dart:async';
import 'dart:convert';

import 'package:dream_book/core/di/service_locator.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

const ALARM_CLOCK_STORAGE_STRING = "alarm_clock";

class AlarmClockStorage {
  final SharedPreferences storage = serviceLocator<SharedPreferences>();

  Future<List<AlarmClockEntity>> getListAlarmClocks() async {
    final String? alarmClocksJson =
        storage.getString(ALARM_CLOCK_STORAGE_STRING);

    if (alarmClocksJson == null) {
      return [];
    }

    final List<dynamic> decodedJson = jsonDecode(alarmClocksJson);

    return decodedJson
        .map((json) => AlarmClockEntity.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveAlarmClock(AlarmClockEntity alarmClock) async {
    final String? alarmClocksJson =
        storage.getString(ALARM_CLOCK_STORAGE_STRING);

    List<Map<String, dynamic>> alarmClocksMap = [];

    if (alarmClocksJson != null) {
      final decodedData = jsonDecode(alarmClocksJson);
      if (decodedData is List<dynamic>) {
        alarmClocksMap = decodedData.cast<Map<String, dynamic>>();
      }
    }

    alarmClocksMap.add(alarmClock.toJson());

    await storage.setString(
        ALARM_CLOCK_STORAGE_STRING, jsonEncode(alarmClocksMap));
  }

  Future<void> deleteAlarmClock(int alarmId) async {
    final String? alarmClocksJson =
        storage.getString(ALARM_CLOCK_STORAGE_STRING);

    if (alarmClocksJson == null) {
      return;
    }

    final List<dynamic> decodedJson = jsonDecode(alarmClocksJson);
    var listAlarmClocks = decodedJson
        .map((json) => AlarmClockEntity.fromJson(json as Map<String, dynamic>))
        .where((element) => element.alarmId != alarmId)
        .toList();

    await storage.setString(
        ALARM_CLOCK_STORAGE_STRING, jsonEncode(listAlarmClocks));
  }

  Future<void> updateAlarmClocks(List<AlarmClockEntity> alarmClocks) async {
    var listAlarmClocks =
        alarmClocks.map((alarmClock) => alarmClock.toJson()).toList();

    await storage.clear();
    await storage.setString(
        ALARM_CLOCK_STORAGE_STRING, jsonEncode(listAlarmClocks));
  }
}
