import 'package:amide_app/core/config/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/models/bar_data.dart';

class RecordsBarChart extends StatelessWidget {
  final List chartSummary;
  final double chartMax, chartMin;
  const RecordsBarChart({
    Key? key,
    required this.chartSummary,
    required this.chartMax,
    required this.chartMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData chartData = BarData(
        day1Amount: chartSummary[0],
        day2Amount: chartSummary[1],
        day3Amount: chartSummary[2],
        day4Amount: chartSummary[3],
        day5Amount: chartSummary[4],
        day6Amount: chartSummary[5],
        day7Amount: chartSummary[6]);

    chartData.initializeBarData();
    return BarChart(BarChartData(
      maxY: chartMax,
      minY: chartMin,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      barGroups: chartData.barData
          .map(
            (data) => BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                  toY: data.y,
                  color: data.y == chartSummary[0]
                      ? Colors.amber[400]
                      : AppColors.primBlue,
                  width: 10,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: chartMax,
                    color: Colors.grey[400],
                  ))
            ]),
          )
          .toList(),
    ));
  }
}
