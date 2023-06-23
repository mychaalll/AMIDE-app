import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RecordsBarChart extends StatelessWidget {
  const RecordsBarChart({
    Key? key,
    required this.minY,
    required this.maxY,
    required this.graph,
  }) : super(key: key);

  final double minY;
  final double maxY;
  final List graph;

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return BarChart(
      BarChartData(
        minY: minY,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: graph.take(7).map((model) {
          return BarChartGroupData(
            x: i++,
            barRods: [
              BarChartRodData(
                width: 10,
                toY: model,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  color: Colors.grey[400],
                  toY: maxY,
                  show: true,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
