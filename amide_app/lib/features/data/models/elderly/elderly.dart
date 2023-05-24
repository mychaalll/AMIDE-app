import 'package:hive/hive.dart';

part 'elderly.g.dart';

class Elderly {
  @HiveField(0)
  final String name;

  final int age;

  final String sex;

  final String? description;

  final String bloodType;
  final double height;

  final double weight;

  final String uid;

  final bool isDeleted;
  final DateTime? timeStamp;

  Elderly({
    required this.name,
    required this.age,
    required this.sex,
    this.description,
    required this.bloodType,
    required this.height,
    required this.weight,
    this.uid = "",
    this.isDeleted = false,
    this.timeStamp,
  });

  factory Elderly.fromJson(Map<String, dynamic> json) => Elderly(
        name: json["name"],
        age: json["age"],
        sex: json["sex"],
        description: json["description"],
        bloodType: json["bloodType"],
        height: json["height"],
        weight: json["weight"],
        uid: json["id"],
        isDeleted: json["isDeleted"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "sex": sex,
        "description": description,
        "bloodType": bloodType,
        "height": height,
        "weight": weight,
        "id": uid,
        "isDeleted": isDeleted,
        "timeStamp": timeStamp,
      };
}
