import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/services/timezone_service.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_list_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/time_picker_vm.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  var sharedPreferencesInstance = await SharedPreferences.getInstance();
  serviceLocator
      .registerSingleton<SharedPreferences>(sharedPreferencesInstance);

  serviceLocator
      .registerSingleton<NotificationService>(NotificationService())
      .setup();

  TimeZone().init();

  Get.put<TimePickerVM>(TimePickerVM(selectedTime: (100 * 24 / 2).toInt().obs),
      permanent: true, tag: "timePickerHours");

  Get.put<TimePickerVM>(TimePickerVM(selectedTime: (100 * 60 / 2).toInt().obs),
      permanent: true, tag: "timePickerMinutes");

  Get.put<AlarmClockListVM>(AlarmClockListVM(), permanent: true);
}
