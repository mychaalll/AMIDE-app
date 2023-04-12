import 'dart:math';

import 'package:amide_app/components/bar-chart.dart';
import 'package:amide_app/components/record-listview.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ElderlyRecords extends StatelessWidget {

  final String temp;
  final List tempSummary;

  final String bpm;
  final List bpmSummary;

  final String bol;
  final List bolSummary;
  ElderlyRecords({super.key, required this.tempSummary, required this.temp, required this.bpm, required this.bpmSummary, required this.bol, required this.bolSummary});
  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      color: AppColors.bgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex:4,
                  child: Container(
                    child: Text(
                      'Elderly Data',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fluctuation',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        width>333? Text(
                          ' last 7 days',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ):Container(),
                      ],
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 20),
            //temperature
            RecordListView(
              title: 'Temperature',
              detail: '$temp° Celcius', 
              width: width, 
              chartSummary: tempSummary,
              chartMax: 50,
              chartMin: 20,
            ),
            SizedBox(height: 10),
            //Blood Pressure
            RecordListView(
              title: 'Blood Pressure',
              detail: '120/80 mmHg', 
              width: width, 
              chartSummary: tempSummary,
              chartMax: 50,
              chartMin: 20,
            ),
            SizedBox(height: 10),
            //Pulse Rate
            RecordListView(
              title: 'Pulse rate',
              detail: '$bpm bpm', 
              width: width, 
              chartSummary: bpmSummary,
              chartMax: 100,
              chartMin: 60,
            ),
            SizedBox(height: 10),
            //Blood Oxygen Level
            RecordListView(
              title: 'Blood Oxygen Level',
              detail: '$bol% SpO2', 
              width: width, 
              chartSummary: bolSummary,
              chartMax: 100,
              chartMin: 80,
            ),
          ],
        ),
      ),
    );
  }
}


