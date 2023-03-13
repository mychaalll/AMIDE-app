import 'package:amide_app/models/reminder.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];
  // reference our box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever opening the app
  void createInitialData() {
    List<Reminder> toDoList = [];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
