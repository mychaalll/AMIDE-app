import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/records/graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RecordsLineChart extends StatelessWidget {
  const RecordsLineChart({
    Key? key,
    required this.graph,
  }) : super(key: key);

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 7,
        minY: graph.minY,
        maxY: graph.maxY,
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: AppColors.primBlue,
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: AppColors.primBlue,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: [
          LineChartBarData(
            spots: graph.data.map(
              (model) {
                return FlSpot(model.id.toDouble(), model.value);
              },
            ).toList(),
            isCurved: true,
            color: AppColors.primBlue,
          )
        ],
      ),
    );
  }
}
