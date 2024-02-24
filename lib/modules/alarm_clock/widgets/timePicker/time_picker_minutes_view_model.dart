import 'package:dream_book/modules/alarm_clock/widgets/timePicker/types/time_picker_view_model_base.dart';
import 'package:get/get.dart';

class TimePickerMinutesViewModel extends GetxController
    implements TimePickerViewModelBase {
  static final TimePickerMinutesViewModel _instance =
      TimePickerMinutesViewModel._internal();

  factory TimePickerMinutesViewModel() {
    return _instance;
  }

  TimePickerMinutesViewModel._internal();

  @override
  var _selectedTime = (100 * 60 / 2).toInt().obs;

  @override
  int get selectedTime => _selectedTime.value % 60;

  @override
  int get scrollControllerValue => _selectedTime.value;

  @override
  void changeSelectedTime(int hour) {
    _selectedTime.value = hour;
  }
}
