// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_clock_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmClockEntity _$AlarmClockEntityFromJson(Map<String, dynamic> json) =>
    AlarmClockEntity(
      alarmId: json['alarmId'] as int,
      time: DateTime.parse(json['time'] as String),
      isEnabled: json['isEnabled'] as bool,
      listForRepeat: AlarmClockRepeatByEntity.fromJson(
          json['listForRepeat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlarmClockEntityToJson(AlarmClockEntity instance) =>
    <String, dynamic>{
      'alarmId': instance.alarmId,
      'time': instance.time.toIso8601String(),
      'isEnabled': instance.isEnabled,
      'listForRepeat': instance.listForRepeat,
    };
