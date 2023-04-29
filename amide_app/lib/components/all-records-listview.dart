import 'package:flutter/material.dart';

class AllRecordsListView extends StatelessWidget {
  final temp, date, bp, bpm, bol;
  AllRecordsListView({
    Key? key, required this.temp, required this.date, required this.bpm, required this.bp, required this.bol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
        ),
      child: Container(
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
                  date,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 10),
              //2nd row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.thermostat_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '$temp° Celcius',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 40),
                        Icon(
                          Icons.monitor_heart_outlined,
                          color: Colors.purple,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '$bp mmHg',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //3rd row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '$bpm BPM',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 40),
                        Icon(
                          Icons.water_drop_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            '$bol% SpO2',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black
                            ),
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
      ),
    );
  }
}