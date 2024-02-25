import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/services/timezone_service.dart';
import 'package:dream_book/features/alarm_clock_edit/view/widgets/time_picker/time_picker_vm.dart';
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
}
