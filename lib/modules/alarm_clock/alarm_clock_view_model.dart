import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/services/schedule_id_service.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker_hours_view_model.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker_minutes_view_model.dart';

class AlarmClockViewModel {
  void registerAlarmClock() {
    int selectedHours = TimePickerHoursViewModel().selectedTime;
    int selectedMinutes = TimePickerMinutesViewModel().selectedTime;

    DateTime now = DateTime.now();
    DateTime scheduledDateTime =
        DateTime(now.year, now.month, now.day, selectedHours, selectedMinutes);

    // If the selected time is before the current time, set the alarm for the next day
    if (scheduledDateTime.isBefore(now)) {
      scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
    }

    // Schedule the notification
    NotificationService.instance.scheduleNotification(
      id: ScheduleId().get(),
      scheduledNotificationDateTime: scheduledDateTime,
    );
  }
}
