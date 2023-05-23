import 'package:amide_app/core/config/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/reminder.dart';

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
  }

  void deleteReminder(key) async {
    var box = await Hive.openBox<Reminder>(_boxName);
    await box.delete(key);

    _reminder = box.values.toList();
    Log.i("Deleted member with key$key");
    notifyListeners();
  }

  void editReminder({Reminder? reminder, int? reminderKey}) async {
    var box = await Hive.openBox<Reminder>(_boxName);

    await box.put(reminderKey, reminder!);
    _reminder = box.values.toList();

    _activeReminder = box.get(reminderKey);

    Log.i("Edited${reminder.name}");
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
