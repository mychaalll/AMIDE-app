import 'package:flutter/material.dart';

class DashboardServices extends ChangeNotifier {
  final List<String> dashboardHeaderList = [
    "ID",
    "Name",
    "Age",
    "Sex",
    "Bloodtype",
  ];

  bool isAscending = false;

  void toggleIsAscending() {
    isAscending = !isAscending;
    notifyListeners();
  }

  int bodyScreenIndex = 0;

  void updateBodyScreen(value) {
    bodyScreenIndex = value;
    notifyListeners();
  }

  String? elderlyId;

  void updateElderlyIndex(String index) {
    elderlyId = index;
    notifyListeners();
  }
}
