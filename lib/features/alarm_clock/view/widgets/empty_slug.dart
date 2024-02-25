import 'package:dream_book/features/alarm_clock_edit/view/alarm_clock_edit.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class EmptySlug extends StatelessWidget {
  const EmptySlug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Установленных будильников еще нет"),
          const SizedBox(height: 16), // Add some spacing
          TextButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: AlarmClockEdit(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }
}
