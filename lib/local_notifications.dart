import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initializeNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          priority: Priority.high, importance: Importance.high));
  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails('channelId', 'channelName',
          priority: Priority.high, importance: Importance.high);

  showNotification(int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Meditation completed',
        'Your meditation is completed',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}
