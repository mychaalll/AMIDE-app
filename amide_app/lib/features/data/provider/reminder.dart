import 'package:amide_app/features/data/models/reminder/music.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/features/data/services/realtime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/reminder/reminder.dart';
// import 'package:timezone/timezone.dart' as tz;

class ReminderData extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController detail = TextEditingController();

  // static const String _boxName = "reminderBox";

  // List<Reminder> _reminder = [];

  // Reminder? _activeReminder;

  // void getReminders() async {
  //   var box = await Hive.openBox<Reminder>(_boxName);

  //   _reminder = box.values.toList();
  //   notifyListeners();
  // }

  // Reminder getReminder(index) {
  //   return _reminder[index];
  // }

  // void addReminder(Reminder reminder) async {
  //   var box = await Hive.openBox<Reminder>(_boxName);
  //   await box.add(reminder);
  //   _reminder = box.values.toList();
  //   notifyListeners();

  //   DateTime dateTime = reminder.dateTime ?? DateTime.now();
  //   Time time = Time(dateTime.hour, dateTime.minute);
  //   NotificationService()
  //       .dailyNotification(notificationTime: time, id: reminder.key, title: reminder.name, body: reminder.detail);

  //   String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  //   Log.i("Daily notification set to $formattedDateTime");
  // }

  // void deleteReminder(key) async {
  //   var box = await Hive.openBox<Reminder>(_boxName);
  //   await box.delete(key);

  //   NotificationService().cancelNotification(id: key);
  //   _reminder = box.values.toList();
  //   Log.i("Deleted member with key$key");

  //   notifyListeners();
  // }

  // void editReminder({Reminder? reminder, int? reminderKey}) async {
  //   var box = await Hive.openBox<Reminder>(_boxName);

  //   await box.put(reminderKey, reminder!);
  //   _reminder = box.values.toList();

  //   _activeReminder = box.get(reminderKey);

  //   DateTime dateTime = reminder.dateTime ?? DateTime.now();
  //   Time time = Time(dateTime.hour, dateTime.minute);
  //   NotificationService()
  //       .updateDailyNotification(notificationTime: time, body: reminder.detail, id: reminder.key, title: reminder.name);
  //   String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  //   // Log.i(
  //   //     "Edited Daily notification set to $formattedDateTime for $reminderKey");
  //   // Log.i(
  //   //     "Daily Notification Key $reminderKey with details ${reminder.detail} and title ${reminder.name}");

  //   Log.i("Updated Title: ${reminder.name}");
  //   Log.i("Updated Details: ${reminder.detail}");
  //   Log.i("Updated Time: ${reminder.time}");
  //   Log.i("Updated DateTime: $formattedDateTime");

  //   notifyListeners();
  // }

  // void setActiveReminder(key) async {
  //   var box = await Hive.openBox<Reminder>(_boxName);

  //   _activeReminder = box.get(key);
  //   notifyListeners();
  // }

  // Reminder getActiveReminder() {
  //   return _activeReminder!;
  // }

  // int get reminderCount {
  //   return _reminder.length;
  // }

  /// START OF FIRESTORE DATABASE

  // Reminder reminder = Reminder(
  //   time: "",
  //   name: "",
  //   detail: "",
  //   dateTime: DateTime.now(),
  // );

  Future<void> createReminder() async {
    final id = const Uuid().v1();

    Reminder reminder = Reminder(
      name: name.text,
      time: timeController.text,
      detail: detail.text,
      dateTime: DateTime.now(),
      id: id,
    );

    await DatabaseServices().createReminder(reminder);

    Music music = Music(
      hour: hour ?? 0,
      minute: minute ?? 0,
      musicKey: musicIndex,
      id: id,
    );

    await Realtime().createData(music);

    clearForm();
    notifyListeners();
  }

  Future<void> editReminder(id) async {
    Reminder reminder = Reminder(
      name: name.text,
      time: timeController.text,
      detail: detail.text,
      dateTime: DateTime.now(),
      id: id,
    );

    await DatabaseServices().editReminder(reminder);

    Music music = Music(
      hour: hour ?? 0,
      minute: minute ?? 0,
      musicKey: musicIndex,
      id: id,
    );

    await Realtime().editData(music);
    clearForm();
    notifyListeners();
  }

  void clearForm() {
    name.clear();
    timeController.clear();
    music = musicList[0];
    detail.clear();
    notifyListeners();
  }

  /// START OF REALTIME DATABASE

  final musicList = [
    "1st music",
    "2nd music",
    "3rd music",
    "4th music",
    "5th music",
    "6th music",
    "7th music",
  ];

  String? music;
  int musicIndex = 0;

  void updateMusic(value) {
    music = value;
    musicIndex = musicList.indexOf(value);
    notifyListeners();
  }

  TextEditingController timeController = TextEditingController();
  final DateTime now = DateTime.now();
  int? hour;
  int? minute;

  void updateTime(value, newTime) {
    timeController.text = value;
    final militaryTime = DateTime(
      now.year,
      now.month,
      now.day,
      newTime.hour,
      newTime.minute,
    );

    hour = militaryTime.hour;
    minute = militaryTime.minute;

    notifyListeners();
  }
}
