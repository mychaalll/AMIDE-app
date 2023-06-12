import 'package:hive/hive.dart';

class Reminder extends HiveObject {
  late String time;
  late String name;
  late String detail;
  late String id;
  late DateTime dateTime;

  Reminder({
    required this.time,
    required this.name,
    required this.detail,
    this.id = "",
    required this.dateTime,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      name: json["name"],
      detail: json["detail"],
      dateTime: json["dateTime"],
      time: json["time"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "detail": detail,
        "dateTime": dateTime,
        "time": time,
        "id": id,
      };
}
