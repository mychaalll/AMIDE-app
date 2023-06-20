import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  final String name;
  final String id;
  final Timestamp dateTime;
  final String detail;

  Reminder({
    required this.name,
    required this.id,
    required this.dateTime,
    required this.detail,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      name: json["name"],
      id: json["id"],
      dateTime: json["dateTime"],
      detail: json["detail"],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> json) => {
        "name": name,
        "id": id,
        "dateTime": dateTime,
        "detail": detail,
      };
}
