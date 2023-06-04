import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:flutter/cupertino.dart';

class ElderlyData extends ChangeNotifier {
  /// START FROM HERE ARE THE FUNCTIONS TO FIREBASE ///

  /// These controllers will help to
  /// create values in firestore

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? bloodType;
  String? sex;
  String uid = "";
  Object? data;

  /// [createData] is the function to send
  /// data in firestore

  void createData() {
    DatabaseServices().sendElderly(
      data: Elderly(
        name: nameController.text,
        age: int.parse(ageController.value.text),
        sex: sex ?? sexList[0],
        bloodType: bloodType ?? bloodTypes[0],
        // height: double.parse(heightController.value.text),
        // weight: double.parse(weightController.value.text),
        isDeleted: false,
      ),
    );

    clearText();
    notifyListeners();
  }

  void clearText() {
    nameController.clear();
    ageController.clear();
    heightController.clear();
    weightController.clear();
    sex = null;
    bloodType = null;
    notifyListeners();
  }

  /// [bloodList] will act as the
  /// values in bloodList dropdown

  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  void updateBloodType(String blood) {
    bloodType = blood;
    notifyListeners();
  }

  /// [sexList] will act as the
  /// values in bloodList dropdown

  final List<String> sexList = [
    'Male',
    'Female',
  ];

  void updateSex(String value) {
    sex = value;
    notifyListeners();
  }

  bool isBar = false;

  void toggleBarGraph() {
    isBar = !isBar;
    notifyListeners();
  }

  List vitalSub = [];
  List temperature = [];
  List heartRate = [];

  // Future<void> getTemperature(uid) async {
  //   final List<VitalSub> response = await DatabaseServices().getTemperature(uid);
  //   vitalSub = response;

  //   temperature = response.map((VitalSub vital) => vital.temperature).toList();
  //   heartRate = response.map((VitalSub vital) => vital.heartRate).toList();

  //   print("Vital List: $temperature");
  //   print("Heart Rate: $heartRate");
  //   notifyListeners();
  // }
}
