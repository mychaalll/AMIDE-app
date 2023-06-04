// To parse this JSON data, do
//
//     final vitalSub = vitalSubFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

VitalSub vitalSubFromJson(String str) => VitalSub.fromJson(json.decode(str));

String vitalSubToJson(VitalSub data) => json.encode(data.toJson());

class VitalSub {
  double temperature;
  double heartRate;
  double oxygenRate;
  double systolic;
  double diastolic;
  Timestamp timeStamp;

  VitalSub({
    required this.temperature,
    required this.heartRate,
    required this.oxygenRate,
    required this.systolic,
    required this.diastolic,
    required this.timeStamp,
  });

  factory VitalSub.fromJson(Map<String, dynamic> json) => VitalSub(
        temperature: json["temperature"].toDouble(),
        heartRate: json["heartRate"].toDouble(),
        oxygenRate: json["oxygenRate"].toDouble(),
        systolic: json["systolic"].toDouble(),
        diastolic: json["diastolic"].toDouble(),
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "heartRate": heartRate,
        "oxygenRate": oxygenRate,
        "systolic": systolic,
        "diastolic": diastolic,
        "timeStamp": timeStamp,
      };
}
