// To parse this JSON data, do
//
//     final vitalSign = vitalSignFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

VitalSign vitalSignFromJson(String str) => VitalSign.fromJson(json.decode(str));

String vitalSignToJson(VitalSign data) => json.encode(data.toJson());

class VitalSign {
  int diastolic;
  int heartRate;
  String id;
  int oxygenRate;
  int systolic;
  int temperature;
  Timestamp timeStamp;

  VitalSign({
    required this.diastolic,
    required this.heartRate,
    required this.id,
    required this.oxygenRate,
    required this.systolic,
    required this.temperature,
    required this.timeStamp,
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        diastolic: json["diastolic"],
        heartRate: json["heartRate"],
        id: json["id"],
        oxygenRate: json["oxygenRate"],
        systolic: json["systolic"],
        temperature: json["temperature"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "diastolic": diastolic,
        "heartRate": heartRate,
        "id": id,
        "oxygenRate": oxygenRate,
        "systolic": systolic,
        "temperature": temperature,
        "timeStamp": timeStamp,
      };
}
