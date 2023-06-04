import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/vital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseServices {
  String uid;

  DatabaseServices({this.uid = ""});

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// [_elderlyFromSnapshot] maps the stream
  /// and  get the elder list from snapshots
  List<Elderly> _elderlyFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Elderly(
        name: doc.get("name") ?? "guest",
        age: doc.get("age") ?? 60,
        sex: doc.get("sex") ?? "Male",
        bloodType: doc.get("bloodType") ?? "",
        height: doc.get("height") ?? 0,
        weight: doc.get("weight") ?? 0,
        uid: doc.get("id") ?? "",
        isDeleted: doc.get("isDeleted") ?? false,
      );
    }).toList();
  }

  /// [elders] get elders stream
  Stream<List<Elderly>> get elders {
    return _db.collection("elderly").orderBy("timeStamp", descending: true).snapshots().map(_elderlyFromSnapshot);
  }

  /// [_elderlyDataFromSnapshot] maps the documentSnapshot
  /// and get the elder list from snapshots

  Elderly _elderlyDataFromSnapshot(DocumentSnapshot snapshot) {
    return Elderly(
      name: snapshot.get("name") ?? "guest",
      age: snapshot.get("age") ?? 60,
      sex: snapshot.get("sex") ?? "Male",
      bloodType: snapshot.get("bloodType") ?? "",
      height: snapshot.get("height") ?? 0,
      weight: snapshot.get("weight") ?? 0,
      uid: uid,
      isDeleted: false,
      timeStamp: snapshot.get("timeStamp"),
    );
  }

  /// [elderData] will get
  /// Elderly model stream

  Stream<Elderly> get elderData {
    return _db.collection("elderly").doc("uid").snapshots().map(_elderlyDataFromSnapshot);
  }

  /// [sendElderly] will send data
  /// to the firestore
  Future<dynamic> sendElderly({Elderly? data}) async {
    final String uuid = const Uuid().v1();

    Elderly elderly = Elderly(
      name: data!.name,
      age: data.age,
      sex: data.sex,
      bloodType: data.bloodType,
      height: data.height,
      weight: data.weight,
      uid: uuid,
      isDeleted: data.isDeleted,
      timeStamp: DateTime.now(),
    );

    await _db.collection("elderly").doc(uuid).set(elderly.toJson());
  }

  /// [updateElderly] will update
  /// the data from the firebase

  Future<dynamic> updateElderly({Elderly? data}) async {
    Elderly elderly = Elderly(
      name: data!.name,
      age: data.age,
      sex: data.sex,
      bloodType: data.bloodType,
      height: data.height,
      weight: data.weight,
      uid: uid,
    );
    await _db.collection("elderly").doc(uid).update(
          elderly.toJson(),
        );
  }

  Future<dynamic> deleteElderly() async {
    await _db.collection("elderly").doc(uid).set({
      "isDeleted": true,
    }, SetOptions(merge: true));
  }

  /// THIS IS START OF VITAL SIGNS

  List<Vital> _vitalFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Vital(
        diastolic: doc.get("diastolic"),
        systolic: doc.get("systolic"),
        oxygenRate: doc.get("oxygenRate"),
        temperature: doc.get("temperature"),
        timeStamp: doc.get("timeStamp"),
        heartRate: doc.get("heartRate"),
        id: doc.get("id"),
      );
    }).toList();
  }

  Stream<List<Vital>> get vital {
    final query = _db.collection("vitalSigns").snapshots().map(_vitalFromSnapshot);
    return query;
  }
}
