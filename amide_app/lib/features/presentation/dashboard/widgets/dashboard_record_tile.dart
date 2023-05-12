import 'package:amide_app/features/data/models/vital_sign.dart';
import 'package:flutter/material.dart';

class DashboardRecordTile extends StatelessWidget {
  final VitalSign vitalSign;
  final String name;
  const DashboardRecordTile({
    Key? key,
    required this.name,
    required this.vitalSign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 10.0),
            //2nd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.thermostat_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${vitalSign.temperature}° Celcius',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      const Icon(
                        Icons.monitor_heart_outlined,
                        color: Colors.purple,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${vitalSign.bloodPressure} mmHg',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //3rd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${vitalSign.heartRate} BPM',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 40),
                      const Icon(
                        Icons.water_drop_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '${vitalSign.oxygenRate}% SpO2',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
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
