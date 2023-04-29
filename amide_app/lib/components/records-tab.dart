import 'dart:math';

import 'package:amide_app/components/bar-chart.dart';
import 'package:amide_app/components/record-listview.dart';
import 'package:amide_app/pages/record/all-records-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ElderlyRecords extends StatefulWidget {
  final String temp;
  final List tempSummary;

  final String bpm;
  final List bpmSummary;

  final String bol;
  final List bolSummary;
  ElderlyRecords({super.key, required this.tempSummary, required this.temp, required this.bpm, required this.bpmSummary, required this.bol, required this.bolSummary});

  @override
  State<ElderlyRecords> createState() => _ElderlyRecordsState();
}


class _ElderlyRecordsState extends State<ElderlyRecords> {
  
  bool _chartIsBar = true;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        width>400? Text(
                          ' last 7 days',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ):Container(),
                        IconButton(
                          onPressed:(){
                            setState(() {
                              _chartIsBar = !_chartIsBar;
                            });
                          }, 
                          icon: Icon(
                            _chartIsBar ? Icons.bar_chart_rounded: Icons.line_axis_rounded,
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  //temperature
                  RecordListView(
                    isBar: _chartIsBar,
                    title: 'Temperature',
                    detail: '${widget.temp}° Celcius', 
                    width: width, 
                    chartSummary: widget.tempSummary,
                    chartMax: 50,
                    chartMin: 20,
                  ),
                  SizedBox(height: 10),
                  //Blood Pressure
                  RecordListView(
                    isBar: _chartIsBar,
                    title: 'Blood Pressure',
                    detail: '120/80 mmHg', 
                    width: width, 
                    chartSummary: widget.tempSummary,
                    chartMax: 50,
                    chartMin: 20,
                  ),
                  SizedBox(height: 10),
                  //Pulse Rate
                  RecordListView(
                    isBar: _chartIsBar,
                    title: 'Pulse Rate',
                    detail: '${widget.bpm} bpm', 
                    width: width, 
                    chartSummary: widget.bpmSummary,
                    chartMax: 100,
                    chartMin: 60,
                  ),
                  SizedBox(height: 10),
                  //Blood Oxygen Level
                  RecordListView(
                    isBar: _chartIsBar,
                    title: 'Blood Oxygen Level',
                    detail: '${widget.bol}% SpO2', 
                    width: width, 
                    chartSummary: widget.bolSummary,
                    chartMax: 100,
                    chartMin: 80,
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              PageTransition(
                                child: AllRecordsPage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
                            overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 5, 27)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                            )
                          ),
                          child: Container(
                            height: 40,
                            child: Center(
                              child: Text(
                                'View All Records',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


