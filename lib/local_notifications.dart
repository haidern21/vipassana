import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';

class LocalNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
   final DarwinInitializationSettings _iosInitialisationSettings =
      DarwinInitializationSettings(notificationCategories: [
    DarwinNotificationCategory(darwinNotificationCategoryPlain,
        actions: [DarwinNotificationAction.plain("identifier", "title")])
  ]);

  void initializeNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: _androidInitializationSettings, iOS: _iosInitialisationSettings);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  final NotificationDetails _notificationDetails = const NotificationDetails(
      iOS: DarwinNotificationDetails(),
      android: AndroidNotificationDetails('channelId', 'channelName',
          priority: Priority.high, importance: Importance.high));
  //
  // AndroidNotificationDetails androidNotificationDetails =
  //     const AndroidNotificationDetails('channelId', 'channelName',
  //         priority: Priority.high, importance: Importance.high);

  showNotification(int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Meditation completed',
        'Your meditation is completed',
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
        _notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}
