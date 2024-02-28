import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/time_card_vm.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card_top.row.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card_turning_on.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/turning_on_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    void deleteTimeCard() {
      vm.deleteAlarmClock(alarmClockItem.alarmId);
    }

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
            TimeCardTopRow(
                deleteAlarmClock: deleteTimeCard, hour: hour, minute: minute),
            TurningOnDivider(vmTimeCard: vmTimeCard),
            TimeCardTurningOn(vmTimeCard: vmTimeCard)
          ],
        ),
      ),
    );
  }
}
