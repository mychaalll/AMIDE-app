import 'package:admin/core/strings/dimen.dart';
import 'package:admin/models/graph.dart';
import 'package:admin/models/vital.dart';
import 'package:admin/services/dashboard.dart';
import 'package:admin/services/database.dart';
import 'package:admin/views/widgets/graph/elderly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescktopStatScreen extends StatefulWidget {
  const DescktopStatScreen({Key? key}) : super(key: key);

  @override
  State<DescktopStatScreen> createState() => _DescktopStatScreenState();
}

class _DescktopStatScreenState extends State<DescktopStatScreen> {
  @override
  Widget build(BuildContext context) {
    final DashboardServices dashboard = Provider.of<DashboardServices>(context);

    return StreamBuilder<List<VitalSign>>(
      stream: DatabaseServices().getVitalSign(dashboard.elderlyId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            final vital = snapshot.data!;
            final temperature = vital.map((VitalSign vitalSign) => vitalSign.temperature).toList();
            final oxygenRate = vital.map((VitalSign vitalSign) => vitalSign.oxygenRate).toList();
            final heartRate = vital.map((VitalSign vitalSign) => vitalSign.heartRate).toList();
            final systolic = vital.map((VitalSign vitalSign) => vitalSign.systolic).toList();
            final diastolic = vital.map((VitalSign vitalSign) => vitalSign.diastolic).toList();

            return Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(Dimen.defaultPadding),
                  child: Column(
                    children: [
                      ElderlyGraphs(
                        graph: Graph(
                          maxY: 40,
                          minY: 30,
                          data: vital.map((VitalSign vitalSign) => vitalSign.temperature).toList(),
                        ),
                        title: "Temperature",
                        detail: "${temperature.first} ° Celcius",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElderlyGraphs(
                        title: "Heart Rate",
                        detail: "${heartRate.first} bpm",
                        graph: Graph(
                          maxY: 100,
                          minY: 70,
                          data: heartRate,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElderlyGraphs(
                        title: "Oxygen Saturation",
                        detail: "${oxygenRate.first} bpm",
                        graph: Graph(
                          maxY: 100,
                          minY: 92,
                          data: oxygenRate,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // CustomButton(
                      //   label: "View All Records",
                      //   onPressed: () {
                      //     context.pushRoute(
                      //       AllRecordsRoute(
                      //         elderly: widget.elderly,
                      //       ),
                      //     );
                      //   },
                      //   hasIcon: false,
                      // ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
