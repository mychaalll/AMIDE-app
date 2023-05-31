class Vital {
  final int diastolic;
  final int systolic;
  final int oxygenRate;
  final int temperature;
  final String timeStamp;
  final int heartRate;
  final String id;

  Vital({
    required this.diastolic,
    required this.systolic,
    required this.oxygenRate,
    required this.temperature,
    required this.timeStamp,
    required this.heartRate,
    required this.id,
  });

  factory Vital.fromJson(Map<String, dynamic> json) => Vital(
        diastolic: json["diastolic"],
        systolic: json["systolic"],
        oxygenRate: json["oxygenRate"],
        temperature: json["temperature"],
        timeStamp: json["timeStamp"],
        heartRate: json["heartRate"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "diastolic": diastolic,
        "systolic": systolic,
        "oxygenRate": oxygenRate,
        "temperatue": temperature,
        "timeStamp": timeStamp,
        "heartRate": heartRate,
        "id": id,
      };
}
