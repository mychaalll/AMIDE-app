import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/graph.dart';
import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/elderly/records/bar_chart/blood_pressure.dart';
import 'package:amide_app/views/widgets/elderly/records/graphs.dart';
import 'package:amide_app/views/widgets/elderly/records/line_chart/blood_pressure.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElderlyRecords extends StatefulWidget {
  const ElderlyRecords({
    this.elderly,
    super.key,
  });

  final Elderly? elderly;

  @override
  State<ElderlyRecords> createState() => _ElderlyRecordsState();
}

class _ElderlyRecordsState extends State<ElderlyRecords> {
  @override
  Widget build(BuildContext context) {
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Elderly Data',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 30),
                      const Text(
                        'Fluctuation',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Text(
                      //   ' last 7 days',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.grey[600],
                      //     fontWeight: FontWeight.w600,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      IconButton(
                        onPressed: () {
                          elderlyData.toggleBarGraph();
                        },
                        icon: Icon(
                          elderlyData.isBar ? Icons.bar_chart_rounded : Icons.line_axis_rounded,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: DatabaseServices().streamVital(widget.elderly!.uid),
              builder: (context, snapshot) {
                final temperature = snapshot.data?.map((VitalSub vitalSub) => vitalSub.temperature).toList();
                final heartRate = snapshot.data?.map((VitalSub vitalSub) => vitalSub.heartRate).toList();
                final oxygenRate = snapshot.data?.map((VitalSub vitalSub) => vitalSub.oxygenRate).toList();
                final systolic = snapshot.data?.map((VitalSub vitalSub) => vitalSub.systolic).toList();
                final diastolic = snapshot.data?.map((VitalSub vitalSub) => vitalSub.diastolic).toList();

                print(temperature);

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      ElderlyGraphs(
                        graph: Graph(
                          maxY: 40,
                          minY: 30,
                          data: temperature ?? [],
                        ),
                        title: "Temperature",
                        detail: "${temperature?.first} ° Celcius",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElderlyGraphs(
                        title: "Heart Rate",
                        detail: "${heartRate?.first} bpm",
                        graph: Graph(
                          maxY: 100,
                          minY: 70,
                          data: heartRate ?? [],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElderlyGraphs(
                        title: "Oxygen Saturation",
                        detail: "${oxygenRate?.first} bpm",
                        graph: Graph(
                          maxY: 100,
                          minY: 92,
                          data: oxygenRate ?? [],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      elderlyData.isBar
                          ? BloodPressureBarChart(
                              systolic: systolic ?? [],
                              diastolic: diastolic ?? [],
                            )
                          : BloodPressureLineChart(
                              systolic: systolic ?? [],
                              diastolic: diastolic ?? [],
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: "View All Records",
                        onPressed: () {
                          context.pushRoute(
                            AllRecordsRoute(
                              elderly: widget.elderly,
                            ),
                          );
                        },
                        hasIcon: false,
                      ),
                    ],
                  );
                } else {
                  return const Column(
                    children: [
                      SizedBox(height: 60),
                      Icon(
                        Icons.cancel_sharp,
                        size: 100,
                      ),
                      Text(
                        'No Records yet',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
