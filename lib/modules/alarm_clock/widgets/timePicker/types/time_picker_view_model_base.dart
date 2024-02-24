import 'package:get/get.dart';

abstract class TimePickerViewModelBase extends GetxController {
  late RxInt _selectedTime;

  int get selectedTime => _selectedTime.value;

  int get scrollControllerValue => _selectedTime.value;

  void changeSelectedTime(int time);
}
