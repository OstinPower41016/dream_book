import 'package:dream_book/modules/alarm_clock/widgets/timePicker/animated_colon.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker_hours_view_model.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker_minutes_view_model.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker_wheel.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final TimePickerHoursViewModel timePickerHoursViewModel =
      TimePickerHoursViewModel();
  final TimePickerMinutesViewModel timePickerMinutesViewModel =
      TimePickerMinutesViewModel();

  TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              width: 100,
              height: 240,
              child: TimePickerWheel(
                  viewModel: timePickerHoursViewModel, childCount: 24)),
          Container(
              margin: const EdgeInsets.only(bottom: 24),
              // child: const Text(":", style: TextStyle(fontSize: 36)),
              child: AnimatedColon()),
          SizedBox(
              width: 100,
              height: 240,
              child: TimePickerWheel(
                viewModel: timePickerMinutesViewModel,
                childCount: 60,
              )),
        ]),
      ),
    );
  }
}
