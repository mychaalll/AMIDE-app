import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        onDidReceiveNotificationResponse: (NotificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            enableVibration: true,
            enableLights: true,
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification({
    int? id,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.show(
        id!, title, body, await notificationDetails());
  }

  Future dailyNotification(
      {int? id,
      String? title,
      String? body,
      String? payLoad,
      required Time notificationTime}) async {
    var now = DateTime.now();
    var scheduledDate = DateTime(now.year, now.month, now.day,
        notificationTime.hour, notificationTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return notificationsPlugin.zonedSchedule(
        id!,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        await notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> updateDailyNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required Time notificationTime,
  }) async {
    // Cancel the existing daily notification
    await notificationsPlugin.cancel(id);

    // Schedule a new daily notification with updated information
    await dailyNotification(
      id: id,
      title: title,
      body: body,
      notificationTime: notificationTime,
    );
  }

  Future cancelNotification({int? id}) async {
    await notificationsPlugin.cancel(id!);
  }

  Future scheduleNotification(
      {int? id,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime}) async {
    return notificationsPlugin.zonedSchedule(
        id!,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
