import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDoList = [];
  // reference our box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever opening the app
  void createInitialData() {
    toDoList = [
      ["08:00AM", "Breakfast", true],
      ["08:00AM", "Breakfast", true],
    ];
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
