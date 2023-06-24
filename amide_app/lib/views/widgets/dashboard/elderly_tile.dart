import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/views/widgets/dashboard/elderly_record/detail.dart';
import 'package:flutter/material.dart';

class DashboardRecordTile extends StatelessWidget {
  const DashboardRecordTile({
    Key? key,
    required this.name,
    required this.data,
  }) : super(key: key);

  final String name;
  final VitalSub data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                fontFamily: 'Montserrat', 
                color: Colors.black
              ),
            ),
            const SizedBox(height: 10.0),
            //2nd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElderlyVitalRecordDetail(
                  label: '${data.temperature}° Celcius',
                  iconData: const Icon(
                    Icons.thermostat_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                ElderlyVitalRecordDetail(
                  label: '${data.systolic}/${data.diastolic} mmHg',
                  iconData: const Icon(
                    Icons.monitor_heart_outlined,
                    color: Colors.purple,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //3rd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElderlyVitalRecordDetail(
                  label: '${data.heartRate} BPM',
                  iconData: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
                ElderlyVitalRecordDetail(
                  label: '${data.oxygenRate}% SpO2',
                  iconData: const Icon(
                    Icons.water_drop_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
