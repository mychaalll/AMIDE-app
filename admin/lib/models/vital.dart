// To parse this JSON data, do
//
//     final VitalSign = VitalSignFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

VitalSign VitalSignFromJson(String str) => VitalSign.fromJson(json.decode(str));

String VitalSignToJson(VitalSign data) => json.encode(data.toJson());

class VitalSign {
  double heartRate;
  double? height;
  double oxygenRate;
  double temperature;
  double? weight;
  double systolic;
  double diastolic;
  Timestamp? timeStamp;

  VitalSign({
    required this.heartRate,
    this.height,
    required this.oxygenRate,
    required this.temperature,
    this.weight,
    required this.systolic,
    required this.diastolic,
    this.timeStamp,
  });

  factory VitalSign.fromJson(Map<String, dynamic> json) => VitalSign(
        heartRate: json["heartRate"].toDouble(),
        height: json["height"].toDouble(),
        oxygenRate: json["oxygenRate"].toDouble(),
        temperature: json["temperature"].toDouble(),
        weight: json["weight"].toDouble(),
        systolic: json["systolic"].toDouble(),
        diastolic: json["diastolic"].toDouble(),
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "heartRate": heartRate,
        "height": height,
        "oxygenRate": oxygenRate,
        "temperature": temperature,
        "weight": weight,
        "systolic": systolic,
        "diastolic": diastolic,
        "timeStamp": timeStamp,
      };
}
