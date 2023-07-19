import 'package:amide_app/core/config/utils.dart';
import 'package:amide_app/features/data/services/local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../models/reminder/reminder.dart';
// import 'package:timezone/timezone.dart' as tz;

class ReminderData extends ChangeNotifier {
  static const String _boxName = "reminderBox";

  List<Reminder> _reminder = [];

  Reminder? _activeReminder;

  void getReminders() async {
    var box = await Hive.openBox<Reminder>(_boxName);

    _reminder = box.values.toList();
    notifyListeners();
  }

  Reminder getReminder(index) {
    return _reminder[index];
  }

  void addReminder(Reminder reminder) async {
    var box = await Hive.openBox<Reminder>(_boxName);
    await box.add(reminder);
    _reminder = box.values.toList();
    notifyListeners();

    // NotificationService().scheduleNotification(
    //     id: reminder.key,
    //     body: reminder.detail,
    //     title: reminder.name,
    //     scheduledNotificationDateTime: reminder.dateTime);
    DateTime dateTime = reminder.dateTime;
    Time time = Time(dateTime.hour, dateTime.minute);
    NotificationService().dailyNotification(
        notificationTime: time,
        id: reminder.key,
        title: reminder.name,
        body: reminder.detail);

    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    Log.i("Daily notification set to $formattedDateTime");
  }

  void deleteReminder(key) async {
    var box = await Hive.openBox<Reminder>(_boxName);
    await box.delete(key);

    NotificationService().cancelNotification(id: key);
    _reminder = box.values.toList();
    Log.i("Deleted member with key$key");
    notifyListeners();
  }

  void editReminder({Reminder? reminder, int? reminderKey}) async {
    var box = await Hive.openBox<Reminder>(_boxName);

    await box.put(reminderKey, reminder!);
    _reminder = box.values.toList();

    _activeReminder = box.get(reminderKey);

    DateTime dateTime = reminder.dateTime;
    Time time = Time(dateTime.hour, dateTime.minute);
    NotificationService().updateDailyNotification(
        notificationTime: time,
        body: reminder.detail,
        id: reminder.key,
        title: reminder.name);
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    // Log.i(
    //     "Edited Daily notification set to $formattedDateTime for $reminderKey");
    // Log.i(
    //     "Daily Notification Key $reminderKey with details ${reminder.detail} and title ${reminder.name}");

    Log.i("Updated Title: ${reminder.name}");
    Log.i("Updated Details: ${reminder.detail}");
    Log.i("Updated Time: ${reminder.time}");
    Log.i("Updated DateTime: $formattedDateTime");

    notifyListeners();
  }

  void setActiveReminder(key) async {
    var box = await Hive.openBox<Reminder>(_boxName);

    _activeReminder = box.get(key);
    notifyListeners();
  }

  Reminder getActiveReminder() {
    return _activeReminder!;
  }

  int get reminderCount {
    return _reminder.length;
  }
}
