import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    const androidInitializationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');


    void onDidReceiveLocalNotification(id, title, body, payload) {
      print("$id $title $body $payload");
    }

    var iosInitializationSetting = DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);


    var initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
      

    await _flutterLocalNotificationsPlugin.initialize(initSettings, onDidReceiveNotificationResponse: (details) => print("${details.id} on tap"));
  }

  void showLocalNotification(String title, String body) {
    const androidNotificationDetail = AndroidNotificationDetails(
        '0', // channel Id
        'general' // channel Name
        );
    const iosNotificatonDetail = DarwinNotificationDetails(
      presentAlert: true
    );
    const notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );
    _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }

  Future<void> scheduleNotification(
      {required int id,
      required DateTime scheduledNotificationDateTime}) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Будильник',
        '',
        tz.TZDateTime.from(DateTime.now().add(Duration(seconds: 3)), tz.local),
        const NotificationDetails(
            iOS: DarwinNotificationDetails(
              presentAlert: true,
            ),
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                autoCancel: false,
                ongoing: true,
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> deleteNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
