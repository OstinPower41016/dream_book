import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_repeat_by_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alarm_clock_entity.g.dart';

@JsonSerializable()
class AlarmClockEntity {
  final int alarmId;
  final DateTime time;
  final bool isEnabled;
  final AlarmClockRepeatByEntity listForRepeat;

  AlarmClockEntity(
      {required this.alarmId,
      required this.time,
      required this.isEnabled,
      required this.listForRepeat});

  factory AlarmClockEntity.fromJson(Map<String, dynamic> json) =>
      _$AlarmClockEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmClockEntityToJson(this);

  AlarmClockEntity copyWith(
      {int? alarmId,
      DateTime? time,
      bool? isEnabled,
      AlarmClockRepeatByEntity? listForRepeat}) {
    return AlarmClockEntity(
        alarmId: alarmId ?? this.alarmId,
        time: time ?? this.time,
        isEnabled: isEnabled ?? this.isEnabled,
        listForRepeat: listForRepeat ?? this.listForRepeat);
  }
}
