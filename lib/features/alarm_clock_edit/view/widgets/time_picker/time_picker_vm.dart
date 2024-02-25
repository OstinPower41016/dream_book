import 'package:get/get.dart';

class TimePickerVM extends GetxController {
  final RxInt selectedTime;

  TimePickerVM({required this.selectedTime});

  void changeSelectedTime(int hour) {
    selectedTime.value = hour;
    update();
  }
}
