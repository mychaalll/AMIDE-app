class Elderly {
  final String name;

  final int age;

  final String sex;

  final String? description;

  final String bloodType;

  final String uid;

  final bool isDeleted;
  final DateTime? timeStamp;

  Elderly({
    required this.name,
    required this.age,
    required this.sex,
    this.description,
    required this.bloodType,
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
        "id": uid,
        "isDeleted": isDeleted,
        "timeStamp": timeStamp,
      };
}
