import 'package:amide_app/features/data/models/records/blood_pressure/diastolic.dart';
import 'package:amide_app/features/data/models/records/blood_pressure/systolic.dart';
import 'package:amide_app/features/data/models/records/temperature.dart';
import 'package:flutter/material.dart';

class VitalSignsService extends ChangeNotifier {
  /// [tempData] will be the temporary
  /// data that wil be used in the
  /// project
  List<Temperature> tempData = [
    Temperature(
      id: 0,
      value: 30,
      date: DateTime.now(),
    ),
    Temperature(
      id: 1,
      value: 50,
      date: DateTime.now(),
    ),
    Temperature(
      id: 2,
      value: 94,
      date: DateTime.now(),
    ),
    Temperature(
      id: 3,
      value: 34,
      date: DateTime.now(),
    ),
    Temperature(
      id: 4,
      value: 44,
      date: DateTime.now(),
    ),
    Temperature(
      id: 5,
      value: 94,
      date: DateTime.now(),
    ),
    Temperature(
      id: 6,
      value: 84,
      date: DateTime.now(),
    ),
    Temperature(
      id: 7,
      value: 14,
      date: DateTime.now(),
    ),
  ];

  /// [systolicData] will be the temporary
  /// data for the blood pressure
  /// in the project
  List<Systolic> systolicData = [
    Systolic(
      date: DateTime.now(),
      id: 0,
      value: 30,
    ),
    Systolic(
      date: DateTime.now(),
      id: 1,
      value: 30,
    ),
    Systolic(
      date: DateTime.now(),
      id: 2,
      value: 30,
    ),
  ];

  /// [systolicData] will be the temporary
  /// data for the blood pressure
  /// in the project
  List<Diastolic> diastolicData = [
    Diastolic(
      date: DateTime.now(),
      id: 0,
      value: 30,
    ),
    Diastolic(
      date: DateTime.now(),
      id: 1,
      value: 30,
    ),
    Diastolic(
      date: DateTime.now(),
      id: 2,
      value: 30,
    ),
  ];
}
