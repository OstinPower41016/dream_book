import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_tab_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AlarmClockTabs extends StatelessWidget {
  final tab_vm = Get.put(AlarmClockTabVM());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedToggleSwitch<TabOptions>.size(
          selectedIconScale: 1.0,
          current: tab_vm.activeTab.value,
          values: const [
            TabOptions.list_alarm_clock,
            TabOptions.edit_alarm_clock,
            TabOptions.settings
          ],
          iconOpacity: 0.2,
          onChanged: tab_vm.changeActiveTab,
          indicatorSize: const Size.fromWidth(100),
          iconBuilder: (value) {
            if (value == TabOptions.list_alarm_clock) {
              return const Icon(Icons.list);
            }
            if (value == TabOptions.edit_alarm_clock) {
              return const Icon(
                Icons.add,
              );
            }
            if (value == TabOptions.settings) {
              return const Icon(Icons.settings);
            }
            return const Text("error");
          },
          borderWidth: 4.0,
          iconAnimationType: AnimationType.onHover,
          style: ToggleStyle(
            borderColor: Colors.transparent,
            indicatorColor: Colors.blue[900],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              const BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
        ));
  }
}
