import 'package:json_annotation/json_annotation.dart';

part 'alarm_clock_repeat_by_entity.g.dart';

@JsonSerializable()
class AlarmClockRepeatByEntity {
  bool monday;
  bool tueday;
  bool wendsday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;

  AlarmClockRepeatByEntity(
      {this.monday = false,
      this.tueday = false,
      this.wendsday = false,
      this.thursday = false,
      this.friday = false,
      this.saturday = false,
      this.sunday = false});

  factory AlarmClockRepeatByEntity.fromJson(Map<String, dynamic> json) =>
      _$AlarmClockRepeatByEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmClockRepeatByEntityToJson(this);
}
