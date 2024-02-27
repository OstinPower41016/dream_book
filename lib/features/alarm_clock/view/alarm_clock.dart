import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_tab_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/alarm_clock_list.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/alarm_clock_edit.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/alarm_clock_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmClock extends StatelessWidget {
  final vm = Get.put(AlarmClockVM());
  final tabVM = Get.put(AlarmClockTabVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlarmClockTabs(),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
            child: Obx(() => _bodyContent(tabVM.activeTab.value)),
          ))
        ],
      ),
    );
  }
}

Widget _bodyContent(TabOptions activeTab) {
  return AnimatedSwitcher(
    duration:
        const Duration(milliseconds: 500), // Adjust the duration as needed
    child: _getContent(activeTab),
  );
}

Widget _getContent(TabOptions activeTab) {
  switch (activeTab) {
    case TabOptions.list_alarm_clock:
      return FadeTransition(
        key: const ValueKey(TabOptions.list_alarm_clock),
        opacity: const AlwaysStoppedAnimation(1.0),
        child: AlarmClockList(),
      );
    case TabOptions.edit_alarm_clock:
      return FadeTransition(
        key: const ValueKey(TabOptions.edit_alarm_clock),
        opacity: const AlwaysStoppedAnimation(1.0),
        child: AlarmClockEdit(),
      );
    default:
      return const Text("unknown widget");
  }
}
