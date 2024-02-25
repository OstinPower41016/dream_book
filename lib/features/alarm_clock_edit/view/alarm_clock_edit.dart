import 'package:dream_book/features/alarm_clock_edit/view/logic/alarm_clock_edit_vm.dart';
import 'package:dream_book/features/alarm_clock_edit/view/widgets/custom_switch/custom_switch.dart';
import 'package:dream_book/features/alarm_clock_edit/view/widgets/time_picker/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmClockEdit extends StatelessWidget {
  final vm = Get.put(AlarmClockEditVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: TimePicker()),
              const Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomSwitch(
                      icon: Icons.cloud,
                    ),
                    SizedBox(height: 16),
                    CustomSwitch(icon: Icons.wb_sunny),
                    SizedBox(height: 16),
                    CustomSwitch(icon: Icons.assistant),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  vm.registerAlarmClock();
                },
                child: const Text("Установить будильник")),
          )
        ],
      ),
    );
  }
}
