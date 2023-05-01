import 'package:hive/hive.dart';

part "elderly.g.dart";

@HiveType(typeId: 0)
class Elderly extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String sex;

  @HiveField(3)
  final String description;

  Elderly({
    required this.name,
    required this.age,
    required this.sex,
    required this.description,
  });
}
