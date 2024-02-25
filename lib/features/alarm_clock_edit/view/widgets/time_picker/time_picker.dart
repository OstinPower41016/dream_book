import 'package:dream_book/features/alarm_clock_edit/view/widgets/animated_colon.dart';
import 'package:dream_book/features/alarm_clock_edit/view/widgets/time_picker/time_picker_wheel.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
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
                  instanceName: "timePickerHours", childCount: 24)),
          Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const AnimatedColon()),
          SizedBox(
            width: 100,
            height: 240,
            child: TimePickerWheel(
              childCount: 60,
              instanceName: "timePickerMinutes",
            ),
          ),
        ]),
      ),
    );
  }
}
