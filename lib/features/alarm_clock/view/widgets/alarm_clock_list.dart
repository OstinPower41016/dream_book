import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/empty_slug.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/time_card/time_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AlarmClockList extends StatelessWidget {
  final vm = Get.put(AlarmClockVM());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (vm.alarmClockList.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (context, i) {
            var listItem = vm.alarmClockList[i];
            return TimeCard(alarmClockItem: listItem);
          },
          itemCount: vm.alarmClockList.length,
        );
      } else {
        return EmptySlug();
      }
    });
  }
}
