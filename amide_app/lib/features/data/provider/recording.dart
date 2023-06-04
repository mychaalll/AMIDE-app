import 'package:amide_app/features/data/models/records/vital.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:flutter/material.dart';

class RecordServices extends ChangeNotifier {
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
    firstStep = false;
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

    firstStep = false;
    doneFirstStep = false;

    secondStep = false;
    doneSecondStep = false;

    thirdStep = false;
    doneThirdStep = false;

    fourthStep = false;
    doneFourthStep = false;

    fifthStep = false;
    doneFifthStep = false;

    notifyListeners();
  }

  double? temperature;
  double? bloodPressure;
  double? pulseRate;
  double? bloodOxygen;

  Future<void> sendVital() async {
    Vital vital = Vital(
      diastolic: 0,
      systolic: 0,
      oxygenRate: 0,
      temperature: 0,
      timeStamp: DateTime.now(),
      heartRate: 0,
      id: "dasd",
    );

    await DatabaseServices().sendVital(vital.toJson());
    notifyListeners();
  }
}
