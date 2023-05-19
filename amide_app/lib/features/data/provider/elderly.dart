import 'package:amide_app/core/config/utils.dart';
import 'package:amide_app/features/data/models/elderly.dart';
import 'package:amide_app/features/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ElderlyData extends ChangeNotifier {
  static const String _boxName = "elderlyBox";

  List<Elderly> _elderly = [];

  late Elderly _activeElderly;

  void getElderlys() async {
    var box = await Hive.openBox<Elderly>(_boxName);

    _elderly = box.values.toList();
    notifyListeners();
  }

  Elderly getElderly(index) {
    return _elderly[index];
  }

  void addElderly(Elderly elderly) async {
    var box = await Hive.openBox<Elderly>(_boxName);
    await box.add(elderly);

    _elderly = box.values.toList();
    notifyListeners();
  }

  void deleteElderly(key) async {
    var box = await Hive.openBox<Elderly>(_boxName);
    await box.delete(key);

    _elderly = box.values.toList();
    Log.i("Deleted member with key$key");
    notifyListeners();
  }

  void editElderly({Elderly? elderly, int? elderlyKey}) async {
    var box = await Hive.openBox<Elderly>(_boxName);

    await box.put(elderlyKey, elderly!);
    _elderly = box.values.toList();

    _activeElderly = box.get(elderlyKey)!;

    Log.i("Edited ${elderly.name}");
    notifyListeners();
  }

  void setActiveElderly(key) async {
    var box = await Hive.openBox<Elderly>(_boxName);

    _activeElderly = box.get(key)!;
    notifyListeners();
  }

  Elderly getActiveElderly() {
    return _activeElderly;
  }

  int get elderlyCount {
    return _elderly.length;
  }

  /// START FROM HERE ARE THE FUNCTIONS TO FIREBASE ///

  /// These controllers will help to
  /// create values in firestore

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? bloodType;
  String? sex;
  String? id;
  Object? data;
  late Elderly elderly = Elderly(
    name: "",
    age: 0,
    sex: "",
    bloodType: "",
    height: 0.0,
    weight: 0.0,
    id: id!,
  );

  /// [sendData] is the function to send
  /// data in firestore

  void sendData() {
    FireStoreServices().sendElderly(
      name: nameController.text,
      age: int.parse(ageController.value.text),
      sex: sex,
      bloodType: bloodType,
      height: double.parse(heightController.value.text),
      weight: double.parse(weightController.value.text),
    );

    nameController.clear();
    ageController.clear();
    heightController.clear();
    weightController.clear();
    notifyListeners();
  }

  Future<void> fetchData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('elderly').doc(id).get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      elderly = Elderly.fromJson(data);

      print(elderly);
      notifyListeners();
    }
  }

  void deleteData() {}

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

  void updateBloodType(String? blood) {
    bloodType = blood;
    print("hi");
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
}
