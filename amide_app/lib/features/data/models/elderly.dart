import 'package:hive/hive.dart';

part "elderly.g.dart";

@HiveType(typeId: 0)
class Elderly extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final String sex;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String bloodType;

  @HiveField(5)
  final double height;

  @HiveField(6)
  final double weight;

  @HiveField(7)
  final String id;
  Elderly({
    required this.name,
    required this.age,
    required this.sex,
    this.description,
    required this.bloodType,
    required this.height,
    required this.weight,
    required this.id,
  });

  factory Elderly.fromJson(Map<String, dynamic> json) => Elderly(
        name: json["name"],
        age: json["age"],
        sex: json["sex"],
        description: json["description"],
        bloodType: json["bloodType"],
        height: json["height"],
        weight: json["weight"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "sex": sex,
        "description": description,
        "bloodType": bloodType,
        "height": height,
        "weight": weight,
        "id": id,
      };
}
