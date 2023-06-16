class Elderly {
  final String id;
  final String name;
  final int age;
  final String sex;
  final String bloodType;

  Elderly({
    required this.id,
    required this.name,
    required this.age,
    required this.sex,
    required this.bloodType,
  });

  factory Elderly.fromJson(Map<String, dynamic> json) {
    return Elderly(
      id: json["id"],
      name: json["name"],
      age: json["name"],
      sex: json["sex"],
      bloodType: json["bloodType"]
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "sex": sex,
        "bloodType": bloodType,
      };
}
