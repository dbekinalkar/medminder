import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;


class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    const AndroidInitializationSettings androidInitSettings = AndroidInitializationSettings('app_icon'); 
    const DarwinInitializationSettings iosInitSettings =  DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(android: androidInitSettings, iOS: iosInitSettings);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification(int id, String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'medMinder_channel',
      'MedMinder Notifications',
      channelDescription: 'Reminders for taking medicines',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }

    // Schedule a notification for a future time
  static Future<void> scheduleNotification(int id, String title, String body, DateTime scheduledDate) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'medMinder_channel',
    'MedMinder Notifications',
    channelDescription: 'Reminders for taking medicines',
    importance: Importance.max,
    priority: Priority.high,
  );
  final DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
  final NotificationDetails notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

  final tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);
  
  await _notificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tzScheduledDate,
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // allows notifications to be delivered at the exact time in Android
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time
  );
}


  // Cancel a notification using its ID
  static Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }
}
