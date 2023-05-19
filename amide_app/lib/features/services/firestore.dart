import 'package:amide_app/features/data/models/elderly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireStoreServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  /// the elderly screen will listen
  /// to this stream
  Stream getElderly() {
    final snap = _db.collection("elderly").snapshots();
    return snap;
  }

  /// [fetchElderly] will get all the fields
  /// in a series of documents

  Future<dynamic> fetchElderly({required String id}) async {
    final query = await _db.collection("elderly").doc(id).get();
    return query;
  }

  /// [sendElderly] will send data
  /// to the firestore
  Future<dynamic> sendElderly({
    name,
    age,
    sex,
    bloodType,
    height,
    weight,
  }) async {
    final String uuid = const Uuid().v1();
    Elderly elderly = Elderly(
      name: name,
      age: age,
      sex: sex,
      bloodType: bloodType,
      height: height,
      weight: weight,
      id: uuid,
    );

    await _db.collection("elderly").doc(uuid).set(
          elderly.toJson(),
        );
  }
}
