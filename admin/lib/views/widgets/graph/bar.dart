import 'package:admin/core/theme/color.dart';
import 'package:admin/models/graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RecordsBarChart extends StatelessWidget {
  const RecordsBarChart({
    Key? key,
    required this.graph,
  }) : super(key: key);

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return BarChart(
      BarChartData(
        minY: graph.minY,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: graph.data.take(7).map((model) {
          return BarChartGroupData(
            x: i++,
            barRods: [
              BarChartRodData(
                width: 10,
                toY: model,
                color: CustomColor.primBlue,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: BackgroundBarChartRodData(
                  color: Colors.grey[400],
                  toY: graph.maxY,
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
