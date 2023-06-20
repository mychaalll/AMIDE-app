// To parse this JSON data, do
//
//     final vitalSub = vitalSubFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

VitalSub vitalSubFromJson(String str) => VitalSub.fromJson(json.decode(str));

String vitalSubToJson(VitalSub data) => json.encode(data.toJson());

class VitalSub {
  double heartRate;
  double? height;
  double oxygenRate;
  double temperature;
  double? weight;
  double systolic;
  double diastolic;
  Timestamp? timeStamp;

  VitalSub({
    required this.heartRate,
    this.height,
    required this.oxygenRate,
    required this.temperature,
    this.weight,
    required this.systolic,
    required this.diastolic,
    this.timeStamp,
  });

  factory VitalSub.fromJson(Map<String, dynamic> json) => VitalSub(
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
