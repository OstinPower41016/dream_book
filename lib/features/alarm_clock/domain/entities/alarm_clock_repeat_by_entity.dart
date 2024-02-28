import 'package:dream_book/shared/constants/days_of_week.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alarm_clock_repeat_by_entity.g.dart';

@JsonSerializable()
class AlarmClockRepeatByEntity {
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;

  AlarmClockRepeatByEntity(
      {this.monday = false,
      this.tuesday = false,
      this.wednesday = false,
      this.thursday = false,
      this.friday = false,
      this.saturday = false,
      this.sunday = false});

  factory AlarmClockRepeatByEntity.fromJson(Map<String, dynamic> json) =>
      _$AlarmClockRepeatByEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AlarmClockRepeatByEntityToJson(this);

  AlarmClockRepeatByEntity copyWith(
    Map<DaysOfWeek, bool> map,
  ) {
    return AlarmClockRepeatByEntity(
      monday: map[DaysOfWeek.monday] ?? monday,
      tuesday: map[DaysOfWeek.tuesday] ?? tuesday,
      wednesday: map[DaysOfWeek.wednesday] ?? wednesday,
      thursday: map[DaysOfWeek.thursday] ?? thursday,
      friday: map[DaysOfWeek.friday] ?? friday,
      saturday: map[DaysOfWeek.saturday] ?? saturday,
      sunday: map[DaysOfWeek.sunday] ?? sunday,
    );
  }
}
