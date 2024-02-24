import 'package:dream_book/modules/alarm_clock/widgets/timePicker/types/time_picker_view_model_base.dart';
import 'package:get/get.dart';

class TimePickerHoursViewModel extends GetxController
    implements TimePickerViewModelBase {
  static final TimePickerHoursViewModel _instance =
      TimePickerHoursViewModel._internal();

  factory TimePickerHoursViewModel() {
    return _instance;
  }

  TimePickerHoursViewModel._internal();

  @override
  var _selectedTime = (100 * 24 / 2).toInt().obs;

  @override
  int get selectedTime => _selectedTime.value % 24;

  @override
  int get scrollControllerValue => _selectedTime.value;

  @override
  void changeSelectedTime(int hour) {
    _selectedTime.value = hour;
  }
}
