import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/time_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final AlarmClockEntity alarmClockItem;
  final vm = Get.put(AlarmClockVM());
  final TimeCardVM vmTimeCard;

  TimeCard({Key? key, required this.alarmClockItem})
      : vmTimeCard = TimeCardVM(alarmClock: alarmClockItem),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String hour = alarmClockItem.time.hour.toString().padLeft(2, "0");
    String minute = alarmClockItem.time.minute.toString().padLeft(2, "0");

    return Container(
      height: 100,
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.black26 ?? Colors.blue),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 5),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '$hour:$minute',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {
                              vm.deleteAlarmClock(alarmClockItem.alarmId);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ))
                      ],
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Obx(() => VerticalDivider(
                  width: 1,
                  color:
                      vmTimeCard.isEnabled.value ? Colors.green : Colors.red)),
            ),
            Column(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () => vmTimeCard.changeIsEnabledTime(true),
                      child: Obx(
                        () => Center(
                            child: Icon(
                          Icons.check,
                          size: 16.0,
                          color: vmTimeCard.isEnabled.value
                              ? Colors.green
                              : Colors.white,
                        )),
                      )),
                ),
                Expanded(
                    child: InkWell(
                  onTap: () => vmTimeCard.changeIsEnabledTime(false),
                  child: Obx(() => Center(
                        child: Icon(
                          Icons.close,
                          size: 16.0,
                          color: vmTimeCard.isEnabled.value
                              ? Colors.white
                              : Colors.red,
                        ),
                      )),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
