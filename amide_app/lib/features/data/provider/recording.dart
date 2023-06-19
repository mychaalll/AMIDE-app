import 'package:flutter/material.dart';

class RecordServices extends ChangeNotifier {
  final TextEditingController systolic = TextEditingController();
  final TextEditingController diastolic = TextEditingController();

  /// for toggle
  bool firstStep = false;

  void toggleFirstStep() {
    firstStep = !firstStep;
    notifyListeners();
  }

  /// for next step

  bool doneFirstStep = false;

  void updateFirstStep() {
    doneFirstStep = true;
    notifyListeners();
  }

  bool secondStep = false;

  void toggleSecondStep() {
    secondStep = !secondStep;
    notifyListeners();
  }

  bool doneSecondStep = false;

  void updateSecondStep() {
    doneSecondStep = true;
    secondStep = false;
    notifyListeners();
  }

  /// for toggle
  bool thirdStep = false;

  void toggleThirdStep() {
    thirdStep = !thirdStep;
    notifyListeners();
  }

  /// for next step

  bool doneThirdStep = false;

  void updateThirdStep() {
    doneThirdStep = true;
    thirdStep = false;
    notifyListeners();
  }

  /// for toggle
  bool fourthStep = false;

  void toggleFourthStep() {
    fourthStep = !fourthStep;
    notifyListeners();
  }

  List<bool> isDropDownList = [
    false,
    false,
    false,
    false,
    false,
  ];

  void toggleIsDropDownList(index) {
    isDropDownList[index] = !isDropDownList[index];
    notifyListeners();
  }

  /// for next step

  bool doneFourthStep = false;

  void updateFourthStep() {
    doneFourthStep = true;
    fourthStep = false;
    notifyListeners();
  }

  /// for toggle
  bool fifthStep = false;

  void toggleFifthStep() {
    fifthStep = !fifthStep;
    notifyListeners();
  }

  /// for next step

  bool doneFifthStep = false;

  void updateFifthStep() {
    doneFifthStep = true;
    fifthStep = false;
    notifyListeners();
  }

  /// for toggle
  bool sixthStep = false;

  void toggleSixthStep() {
    sixthStep = !sixthStep;
    notifyListeners();
  }

  /// for next step
  bool doneSixthStep = false;

  void updateSixthStep() {
    doneSixthStep = true;
    sixthStep = false;
    notifyListeners();
  }

  /// for toggle
  bool finishStep = false;

  void toggleFinishStep() {
    finishStep = !finishStep;
    notifyListeners();
  }

  /// for next step
  bool doneFinishStep = false;

  void updateFinishStep() {
    doneFirstStep = false;

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
    return (heartRate != -1 && height != -1 && oxygenRate != -1 && temperature != -1 && weight != -1);
  }

  // Future<void> sendVital() async {
  //   VitalSub vital = VitalSub(
  //     diastolic: 0,
  //     systolic: 0,
  //     oxygenRate: 0,
  //     temperature: 0,
  //     timeStamp: DateTime.now(),
  //     heartRate: 0,
  //     id: "dasd",
  //   );

  //   await DatabaseServices().sendVital(vital.toJson());
  //   notifyListeners();
  // }
}
