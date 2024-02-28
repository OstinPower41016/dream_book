import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_item_vm.dart';
import 'package:dream_book/shared/constants/days_of_week.dart';
import 'package:dream_book/shared/widgets/text_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCardBottomRow extends StatelessWidget {
  final AlarmClockItemVM vmAlarmItem;

  TimeCardBottomRow({required this.vmAlarmItem});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Obx(() => TextCheckbox(
                  text: "Пн",
                  onChange: (value) {
                    vmAlarmItem.updateDaysRepeat(DaysOfWeek.monday, value);
                  },
                  checked:
                      vmAlarmItem.alarmClock.value.listForRepeat.monday.obs,
                )),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Вт",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.tuesday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.tuesday.obs,
            ),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Ср",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.wednesday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.wednesday.obs,
            ),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Чт",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.thursday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.thursday.obs,
            ),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Пт",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.friday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.friday.obs,
            ),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Сб",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.saturday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.saturday.obs,
            ),
            const SizedBox(
              width: 12,
            ),
            TextCheckbox(
              text: "Вс",
              onChange: (value) {
                vmAlarmItem.updateDaysRepeat(DaysOfWeek.sunday, value);
              },
              checked: vmAlarmItem.alarmClock.value.listForRepeat.sunday.obs,
            ),
          ],
        ));
  }
}
