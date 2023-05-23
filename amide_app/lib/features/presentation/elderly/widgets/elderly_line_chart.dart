import 'package:amide_app/core/config/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ElderlyLineChart extends StatelessWidget {
  final List chartSummary;
  final double chartMax, chartMin;
  const ElderlyLineChart(
      {super.key,
      required this.chartSummary,
      required this.chartMax,
      required this.chartMin});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        maxY: chartMax,
        minY: chartMin,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.black,
              strokeWidth: 1,
            );
          },
          drawHorizontalLine: false,
        ),
        lineBarsData: [
          LineChartBarData(spots: [
            FlSpot(0, chartSummary[0]),
            FlSpot(1, chartSummary[1]),
            FlSpot(2, chartSummary[2]),
            FlSpot(3, chartSummary[3]),
            FlSpot(4, chartSummary[4]),
            FlSpot(5, chartSummary[5]),
            FlSpot(6, chartSummary[6]),
          ], isCurved: true, color: AppColors.primBlue),
        ],
      ),
    );
  }
}
