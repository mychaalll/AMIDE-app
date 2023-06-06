import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:flutter/material.dart';

class RecordTile extends StatelessWidget {
  const RecordTile({
    Key? key,
    required this.vital,
    required this.date,
  }) : super(key: key);

  final VitalSub vital;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              date,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'Montserrat', color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
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
                        '${vital.temperature}° Celcius',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Montserrat', color: Colors.black),
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
                        '${vital.systolic / vital.diastolic} mmHg',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Montserrat', color: Colors.black),
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
                        '${vital.heartRate} BPM',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Montserrat', color: Colors.black),
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
                        '${vital.oxygenRate}% SpO2',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Montserrat', color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
