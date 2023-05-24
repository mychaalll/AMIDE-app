import 'package:flutter/material.dart';

class DashboardRecordTile extends StatelessWidget {
  final String name, temp, time, bp, bpm, bol;
  const DashboardRecordTile({
    Key? key,
    required this.temp,
    required this.time,
    required this.bpm,
    required this.bp,
    required this.bol,
    required this.name,
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
                          '$temp° Celcius',
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
                          '$bp mmHg',
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
                          '$bpm BPM',
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
                          '$bol% SpO2',
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
