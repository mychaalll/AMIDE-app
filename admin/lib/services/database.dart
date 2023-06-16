import 'package:admin/models/elderly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseServices extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Elderly>> getElderly() {
    return _db.collection("elderly").orderBy("timeStamp", descending: false).snapshots().map(elderlySnapshot);
  }

  List<Elderly> elderlySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Elderly(
        id: doc.get("id"),
        name: doc.get("name"),
        age: doc.get("age"),
        sex: doc.get("sex"),
        bloodType: doc.get("bloodType"),
      );
    }).toList();
  }

  Future<void> deleteData(id) async {
    await _db.collection("elderly").doc(id).delete();
  }
}
