import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/graph.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/features/data/provider/vital_signs.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/elderly/records/bar_chart/blood_pressure.dart';
import 'package:amide_app/views/widgets/elderly/records/graphs.dart';
import 'package:amide_app/views/widgets/elderly/records/line_chart/blood_pressure.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElderlyRecords extends StatelessWidget {
  const ElderlyRecords({
<<<<<<< HEAD:amide_app/lib/views/screens/elderly/pages/records.dart
    Key? key,
    required this.elderly,
  }) : super(key: key);

  final Elderly elderly;
=======
    this.elderly,
    super.key,
  });
>>>>>>> 176acc8ba474f2ab4c05464403bf78d71c059f99:amide_app/lib/features/screens/elderly/pages/records.dart

  final Elderly? elderly;

  @override
  Widget build(BuildContext context) {
    final VitalSignsService vitalSign = Provider.of<VitalSignsService>(context);
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                DatabaseServices().getVitalSigns(elderly.uid);
                print(elderly.uid);
              },
              child: const Text("Fetch vital sign"),
            ),
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

            ElderlyGraphs(
              title: "Temperature",
              detail: "${vitalSign.tempData.last.value} ° Celcius",
              graph: Graph(
                maxY: 100,
                minY: 0,
                data: vitalSign.tempData,
              ),
            ),
            const SizedBox(height: 50),

            /// Graph for blood pressure
            elderlyData.isBar ? const BloodPressureBarChart() : const BloodPressureLineChart(),
            const SizedBox(height: 50),

            ElderlyGraphs(
              title: "Oxygen Rate",
              detail: "${vitalSign.tempData.last.value} ° Celcius",
              graph: Graph(
                maxY: 100,
                minY: 0,
                data: vitalSign.tempData,
              ),
            ),
            const SizedBox(height: 50),

            ElderlyGraphs(
              title: "Heart Rate",
              detail: "${vitalSign.tempData.last.value} ° Celcius",
              graph: Graph(
                maxY: 100,
                minY: 0,
                data: vitalSign.tempData,
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            CustomButton(
              label: "View All Records",
              onPressed: () {
                context.pushRoute(
                  const AllRecordsRoute(),
                );
              },
              hasIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}