import 'package:hive/hive.dart';

part "reminder.g.dart";

@HiveType(typeId: 1)
class Reminder extends HiveObject {
  @HiveField(0)
  late String time;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String? detail;

  Reminder({
    required this.time,
    required this.name,
    required this.detail,
  });
}
