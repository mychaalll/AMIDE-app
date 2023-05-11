import 'package:amide_app/features/presentation/elderly/widgets/elderly_line_chart.dart';
import 'package:flutter/material.dart';

import 'records_bar_chart.dart';

class ElderlyBarChart extends StatelessWidget {
  const ElderlyBarChart({
    Key? key,
    required this.width,
    required this.chartSummary,
    required this.detail,
    required this.title,
    required this.chartMax,
    required this.chartMin,
    required this.isBar,
  }) : super(key: key);

  final bool isBar;
  final String detail;
  final String title;
  final double width, chartMax, chartMin;
  final List chartSummary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
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
                const SizedBox(height: 5),
                Text(
                  detail,
                  style: const TextStyle(
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
        SizedBox(
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
                : ElderlyLineChart(
                    chartSummary: chartSummary,
                    chartMax: chartMax,
                    chartMin: chartMin,
                  ),
          ),
        ),
      ],
    );
  }
}
