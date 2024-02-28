import 'package:flutter/material.dart';

class TimeCardTopRow extends StatelessWidget {
  final void Function() deleteAlarmClock;
  final String hour;
  final String minute;

  TimeCardTopRow(
      {required this.deleteAlarmClock,
      required this.hour,
      required this.minute});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
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
                    onPressed: deleteAlarmClock,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 18,
                    ))
              ],
            )
          ],
        ));
  }
}
