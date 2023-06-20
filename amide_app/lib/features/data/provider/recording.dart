import 'package:flutter/material.dart';

class RecordServices extends ChangeNotifier {
  final TextEditingController systolic = TextEditingController();
  final TextEditingController diastolic = TextEditingController();

  final realtimeKey = [
    "heartRate",
    "height",
    "oxygenRate",
    "temperature",
    "weight",
  ];

  final recordTitleList = [
    "Heart Rate",
    "Height",
    "Oxygen Rate",
    "Body Temperature",
    "Weight",
  ];

  final bodyTextList = [
    "To measure the patient's pulse rate accurately make sure it is snugly secured. Ask the patient to remain still and avoid talking during the reading for the most accurate results.",
    "Stand against a flat wall: Find a clear wall with no objects or decorations that might obstruct your height measurement. Read the measurement: Look at the point on the measuring tape or ruler where it intersects with the top of your head. This indicates your height in the unit of measurement being used (e.g., centimeters).",
    "To measure the patient's blood oxygen level accurately, attach the sensor to the patient's fingertip and ensure it is securely in place. Ask the patient to remain still and avoid moving the hand or finger being used for the reading.",
    "Ensure that the temperature sensor is in contact with the patient's body for at least 1-2 minutes or until a temperature reading is obtained to ensure accurate measurements.",
    "Step on the scale: Instruct the person whose weight you want to measure to step onto the scale. They should stand still with their feet evenly distributed on the scale's surface. Record the weight measurement: Note down the weight measurement in the desired unit of measurement, such as kilograms or pounds. If necessary, round the measurement to the nearest whole unit.",
  ];

  final rangeOfVitalSignList = [
    "Normal Heart Rate Range is: 60bpm - 100bpm",
    "",
    "Normal Oxygen Rate: 95% - 100%",
    "Normal Body Temperature: 36.2C - 37C",
    "",
  ];

  final vitalUnit = [
    "bpm",
    "cm",
    "%",
    "Celcius",
    "kg",
  ];

  /// drop down list

  List<bool> dropdownList = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void toggleRecordDropdown(index) {
    dropdownList[index] = !dropdownList[index];
    notifyListeners();
  }

  /// [doneList] toggle if it is done

  List<bool> doneList = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  bool isLoading = false;

  void toggleDone(index) {
    doneList[index] = !doneList[index];
    isLoading = true;
    Future.delayed(const Duration(seconds: 10), () {
      isLoading = false;
    });
    notifyListeners();
  }

  void updateRetry() {}

  /// blood pressure

  bool dropDownBp = false;

  void toggleDropdownBp() {
    dropDownBp = !dropDownBp;
    notifyListeners();
  }

  final TextEditingController bloodPressure = TextEditingController();

  String? bpValue;

  void updateBpValue() {
    bpValue = ("${systolic.text}/${diastolic.text}");
    notifyListeners();
  }

  void resetBp() {
    bpValue = null;
    notifyListeners();
  }

  void clearRecord() {
    dropdownList = List<bool>.generate(dropdownList.length, (index) => false);
    doneList = List<bool>.generate(doneList.length, (index) => false);
    bpValue = null;
    systolic.clear();
    diastolic.clear();
    dropDownBp = false;

    notifyListeners();
  }

  double? temperature;
  double? oxygenRate;
  double? heartRate;
  double? height;
  double? weight;

  void updateTemperature(value) {
    temperature = value.toDouble();
    notifyListeners();
  }

  void updateHeartRate(value) {
    heartRate = value.toDouble();
    notifyListeners();
  }

  void updateOxygenRate(value) {
    oxygenRate = value.toDouble();
    notifyListeners();
  }

  void updateHeight(value) {
    height = value.toDouble();
    notifyListeners();
  }

  void updateWeight(value) {
    weight = value.toDouble();
    notifyListeners();
  }

  bool isEnabledValidation() {
    return (heartRate != -1 &&
        height != -1 &&
        oxygenRate != -1 &&
        temperature != -1 &&
        weight != -1 &&
        systolic.text.isNotEmpty &&
        diastolic.text.isNotEmpty);
  }
}
