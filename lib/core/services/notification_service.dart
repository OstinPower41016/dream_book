import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService._();

  static NotificationService? _instance;

  static NotificationService get instance {
    _instance ??= NotificationService._();
    return _instance!;
  }

  Future<void> setup() async {
    const androidInitializationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSetting = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void showLocalNotification(String title, String body) {
    const androidNotificationDetail = AndroidNotificationDetails(
        '0', // channel Id
        'general' // channel Name
        );
    const iosNotificatonDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );
    _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }

  Future<void> scheduleNotification(
      {int id = 0, required DateTime scheduledNotificationDateTime}) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Будильник',
        '',
        tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
