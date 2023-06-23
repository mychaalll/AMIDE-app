import 'package:admin/core/strings/dimen.dart';
import 'package:admin/models/vital.dart';
import 'package:admin/services/dashboard.dart';
import 'package:admin/services/database.dart';
import 'package:admin/views/widgets/graph/bar.dart';
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
            print(snapshot.data);
            // return Padding(
            //   padding: EdgeInsets.all(Dimen.defaultPadding),
            //   child: const Expanded(
            //     child: RecordsBarChart(
            //       minY: 55,
            //       maxY: 100,
            //       graph: [],
            //     ),
            //   ),
            // );
            final vital = snapshot.data!;

            return Padding(
              padding: EdgeInsets.all(Dimen.defaultPadding),
              child: Container(
                height: 300,
                width: 300,
                color: Colors.red,
                child: ListView.builder(
                  itemCount: vital.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      height: 300,
                      child: RecordsBarChart(
                        minY: 40,
                        maxY: 30,
                        graph: vital.map((VitalSign vitalSign) => vitalSign.temperature).toList(),
                      ),
                    );
                  },
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
