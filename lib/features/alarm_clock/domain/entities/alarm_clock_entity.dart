import 'package:json_annotation/json_annotation.dart';

part 'alarm_clock_entity.g.dart';

@JsonSerializable()
class AlarmClockEntity {
  final String alarmId;
  final DateTime time;

  AlarmClockEntity({required this.alarmId, required this.time});

  factory AlarmClockEntity.fromJson(Map<String, dynamic> json) =>
      _$AlarmClockEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmClockEntityToJson(this);
}
