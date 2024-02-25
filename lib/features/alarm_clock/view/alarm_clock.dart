import 'package:dream_book/features/alarm_clock/view/logic/alarm_clock_vm.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/empty_slug.dart';
import 'package:dream_book/features/alarm_clock/view/widgets/timeCard.dart';
import 'package:dream_book/features/alarm_clock_edit/view/alarm_clock_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AlarmClock extends StatelessWidget {
  final vm = Get.put(AlarmClockVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Obx(() {
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
      }),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.red,
        mini: true,
        backgroundColor: Colors.blue[900],
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: AlarmClockEdit(),
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
