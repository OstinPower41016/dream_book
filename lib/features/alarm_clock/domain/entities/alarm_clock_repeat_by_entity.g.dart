// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_clock_repeat_by_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmClockRepeatByEntity _$AlarmClockRepeatByEntityFromJson(
        Map<String, dynamic> json) =>
    AlarmClockRepeatByEntity(
      monday: json['monday'] as bool? ?? false,
      tueday: json['tueday'] as bool? ?? false,
      wendsday: json['wendsday'] as bool? ?? false,
      thursday: json['thursday'] as bool? ?? false,
      friday: json['friday'] as bool? ?? false,
      saturday: json['saturday'] as bool? ?? false,
      sunday: json['sunday'] as bool? ?? false,
    );

Map<String, dynamic> _$AlarmClockRepeatByEntityToJson(
        AlarmClockRepeatByEntity instance) =>
    <String, dynamic>{
      'monday': instance.monday,
      'tueday': instance.tueday,
      'wendsday': instance.wendsday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };
