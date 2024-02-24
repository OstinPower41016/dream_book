import 'package:dream_book/core/services/notification_service.dart';
import 'package:dream_book/core/services/schedule_id_service.dart';
import 'package:dream_book/modules/alarm_clock/alarm_clock_view_model.dart';
import 'package:dream_book/modules/alarm_clock/widgets/timePicker/time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dream_book/modules/alarm_clock/widgets/customSwitch/custom_switch.dart';

class AlarmClockScreen extends StatelessWidget {
  final viewModel = AlarmClockViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Действие при нажатии на кнопку настроек
            },
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
                onPressed: viewModel.registerAlarmClock,
                child: const Text("Установить будильник")),
          )
        ],
      ),
    );
  }
}
