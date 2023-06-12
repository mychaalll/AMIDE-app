// To parse this JSON data, do
//
//     final vitalSub = vitalSubFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

VitalSub vitalSubFromJson(String str) => VitalSub.fromJson(json.decode(str));

String vitalSubToJson(VitalSub data) => json.encode(data.toJson());

class VitalSub {
  double? temperature;
  double? heartRate;
  double? oxygenRate;
  double? systolic;
  double? diastolic;
  double? height;
  double? weight;
  Timestamp? timeStamp;

  VitalSub({
    this.temperature,
    this.heartRate,
    this.oxygenRate,
    this.systolic,
    this.diastolic,
    this.weight,
    this.height,
    this.timeStamp,
  });

  factory VitalSub.fromJson(Map<String, dynamic> json) => VitalSub(
        temperature: json["temperature"].toDouble(),
        // heartRate: json["heartRate"].toDouble(),
        // oxygenRate: json["oxygenRate"].toDouble(),
        // systolic: json["systolic"].toDouble(),
        // diastolic: json["diastolic"].toDouble(),
        height: json["height"].toDouble(),
        // weight: json["weight"].toDouble(),
        // timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "heartRate": heartRate,
        "oxygenRate": oxygenRate,
        "systolic": systolic,
        "diastolic": diastolic,
        "timeStamp": timeStamp,
        "height": height,
        "weight": weight,
      };
}