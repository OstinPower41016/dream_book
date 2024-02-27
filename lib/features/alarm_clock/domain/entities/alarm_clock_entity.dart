import 'package:json_annotation/json_annotation.dart';

part 'alarm_clock_entity.g.dart';

@JsonSerializable()
class AlarmClockEntity {
  final String alarmId;
  final DateTime time;
  final bool isEnabled;

  AlarmClockEntity(
      {required this.alarmId, required this.time, required this.isEnabled});

  factory AlarmClockEntity.fromJson(Map<String, dynamic> json) =>
      _$AlarmClockEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmClockEntityToJson(this);

  AlarmClockEntity copyWith(
      {String? alarmId, DateTime? time, bool? isEnabled}) {
    return AlarmClockEntity(
      alarmId: alarmId ?? this.alarmId,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
