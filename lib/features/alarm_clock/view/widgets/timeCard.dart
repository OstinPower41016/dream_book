import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCard extends StatelessWidget {
  final AlarmClockEntity alarmClockItem;
  final vm = Get.put(AlarmClockVM());

  TimeCard({super.key, required this.alarmClockItem});

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
          border: Border.all(color: Colors.blueAccent[100] ?? Colors.blue),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.blueAccent[100] ?? Colors.blue,
                blurRadius: 5.0,
                offset: Offset(0, 0),
                spreadRadius: 0.0)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '$hour:$minute',
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      vm.deleteAlarmClock(alarmClockItem.alarmId);
                    },
                    icon: Icon(Icons.delete, color: Colors.red))
              ],
            )
          ],
        ),
      ),
    );
  }
}
