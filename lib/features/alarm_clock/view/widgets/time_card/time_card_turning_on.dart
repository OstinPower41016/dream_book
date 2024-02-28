import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_item_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCardTurningOn extends StatelessWidget {
  final AlarmClockItemVM vmAlarmItem;

  TimeCardTurningOn({required this.vmAlarmItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
              onTap: () => vmAlarmItem.changeIsEnabledTime(true),
              child: Obx(
                () => Center(
                    child: Icon(
                  Icons.check,
                  size: 16.0,
                  color: vmAlarmItem.alarmClock.value.isEnabled
                      ? Colors.green
                      : Colors.white,
                )),
              )),
        ),
        Expanded(
            child: InkWell(
          onTap: () => vmAlarmItem.changeIsEnabledTime(false),
          child: Obx(() => Center(
                child: Icon(
                  Icons.close,
                  size: 16.0,
                  color: vmAlarmItem.alarmClock.value.isEnabled
                      ? Colors.white
                      : Colors.red,
                ),
              )),
        ))
      ],
    );
  }
}
