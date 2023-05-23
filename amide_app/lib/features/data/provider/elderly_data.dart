import 'package:amide_app/core/config/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/elderly.dart';

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
}
