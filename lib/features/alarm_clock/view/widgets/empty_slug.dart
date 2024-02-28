import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_tab_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptySlug extends StatelessWidget {
  var alarmClockTabVM = Get.put(AlarmClockTabVM());

  EmptySlug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Установленных будильников еще нет"),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              alarmClockTabVM.changeActiveTab(TabOptions.edit_alarm_clock);
            },
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }
}
