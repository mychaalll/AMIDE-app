import 'package:flutter/material.dart';

import '../../records/widgets/bar_chart.dart';
import 'elderly_line_chart.dart';

class ElderlyBarChart extends StatelessWidget {
  ElderlyBarChart({
    Key? key,
    required this.width,
    required this.chartSummary,
    required this.detail,
    required this.title,
    required this.chartMax,
    required this.chartMin,
    required this.isBar,
  }) : super(key: key);

  bool isBar;
  final String detail;
  final String title;
  final double width, chartMax, chartMin;
  final List chartSummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    detail,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: (width * 0.6) - 15,
            height: 100,
            child: Align(
              alignment: Alignment.centerRight,
              child: isBar == true
                  ? RecordsBarChart(
                      chartSummary: chartSummary,
                      chartMax: chartMax,
                      chartMin: chartMin,
                    )
                  : RecordsLineChart(
                      chartSummary: chartSummary,
                      chartMax: chartMax,
                      chartMin: chartMin,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
