import 'dart:async';

import 'package:amide_app/features/data/models/reminder/music.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class Realtime {
  final DatabaseReference alarm_db = FirebaseDatabase.instance.ref("alarms");

  Future<void> createData(Music music) async {
    String? autoGeneratedId = alarm_db.push().key;

    final int id = int.parse(music.id!.replaceAll("-", "").substring(0, 4), radix: 16);
    print("Create id: $id");

    await alarm_db.child(autoGeneratedId!).remove().then(
          (value) => alarm_db.child("$id").set(music.toJson()),
        );
  }

  Future<void> editData(Music music) async {
    final int id = int.parse(music.id!.replaceAll("-", "").substring(0, 4), radix: 16);
    await alarm_db.child("$id").update(music.toJson());
  }

  Future<void> deleteData(String uid) async {
    final int id = int.parse(uid.replaceAll("-", "").substring(0, 4), radix: 16);
    print("Delete id: $id");
    await alarm_db.child("$id").remove();
  }

  final DatabaseReference vital_db = FirebaseDatabase.instance.ref("vitals");

  /// [recordData] when the check all equipments tap the done
  /// it will set the vital signs to -1

  Future<void> recordData(context) async {
    final RecordServices record = Provider.of<RecordServices>(context, listen: false);
    record.resetBp();
    await vital_db.update({
      "heartRate": -1.0,
      "height": -1.0,
      "weight": -1.0,
      "oxygenRate": -1.0,
      "temperature": -1.0,
    });

    print("Set to -1.0");
  }

  Future<void> resetData(context, index) async {
    final RecordServices record = Provider.of<RecordServices>(context, listen: false);

    await vital_db.update({
      // record.realtimeKey[index - 1]: -1.0,
      record.realtimeKey[index - 1]: -1.0,
    });
  }
}
