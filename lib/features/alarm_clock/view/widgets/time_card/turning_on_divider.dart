import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_item_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TurningOnDivider extends StatelessWidget {
  final AlarmClockItemVM vmTimeCard;

  TurningOnDivider({required this.vmTimeCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Obx(() => VerticalDivider(
          width: 1,
          color: vmTimeCard.alarmClock.value.isEnabled ? Colors.green : Colors.red)),
    );
  }
}
