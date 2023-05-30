import 'package:amide_app/features/data/models/reminder/music.dart';
import 'package:firebase_database/firebase_database.dart';

class Realtime {
  final DatabaseReference db = FirebaseDatabase.instance.ref("alarms");

  void createData(Music music) {
    db.push().set(music.toJson());
  }
}
