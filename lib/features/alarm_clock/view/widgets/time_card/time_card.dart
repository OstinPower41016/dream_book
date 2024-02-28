import 'package:dream_book/features/alarm_clock/domain/entities/alarm_clock_entity.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_item_vm.dart';
import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_list_vm.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card_bottom_row.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card_top.row.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card_turning_on.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/turning_on_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCard extends StatelessWidget {
  final AlarmClockEntity alarmClockItem;
  final vmAlarmList = Get.find<AlarmClockListVM>();
  final AlarmClockItemVM vmAlarmItem;

  TimeCard({Key? key, required this.alarmClockItem})
      : vmAlarmItem = AlarmClockItemVM(alarmClock: alarmClockItem.obs),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String hour = alarmClockItem.time.hour.toString().padLeft(2, "0");
    String minute = alarmClockItem.time.minute.toString().padLeft(2, "0");

    void deleteTimeCard() {
      vmAlarmList.deleteAlarmClock(alarmClockItem.alarmId);
    }

    return Container(
      height: 125,
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 5),
            ),
          ]),
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 8.0, left: 16.0, right: 32.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      TimeCardTopRow(
                          deleteAlarmClock: deleteTimeCard,
                          hour: hour,
                          minute: minute),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimeCardBottomRow(
                    vmAlarmItem: vmAlarmItem,
                  ),
                ],
              )),
          Positioned(
            top: 8,
            bottom: 8,
            right: 22,
            child: TurningOnDivider(vmAlarmItem: vmAlarmItem),
          ),
          Positioned(
            top: 5,
            bottom: 1,
            right: 0,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TimeCardTurningOn(vmAlarmItem: vmAlarmItem)),
          )
        ],
      ),
    );
  }
}
