import 'package:amide_app/core/config/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BMIBarChart extends StatelessWidget {
  const BMIBarChart({
    Key? key,
    required this.height,
    required this.weight,
    required this.date,
  }) : super(key: key);

  final List<double> height;
  final List<double> weight;
  final String date;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    int j = 0;

    final double bmi = weight.first / ((height.first) / 100 * (height.first) / 100);

    return Container(
      height: 400,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Body Mass Index",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  textAlign: TextAlign.center,
                  "${bmi.toStringAsFixed(2)} kg/m²",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // height
                Expanded(
                  child: BarChart(
                    BarChartData(
                      minY: 140,
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      barGroups: height.take(7).map((model) {
                        return BarChartGroupData(
                          x: i++,
                          barRods: [
                            BarChartRodData(
                              width: 10,
                              toY: model,
                              color: AppColors.primBlue,
                              borderRadius: BorderRadius.circular(4),
                              backDrawRodData: BackgroundBarChartRodData(
                                color: Colors.grey[400],
                                toY: 200,
                                show: true,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // weight
                Expanded(
                  child: BarChart(
                    BarChartData(
                      minY: 70,
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      barGroups: weight.take(7).map((model) {
                        return BarChartGroupData(
                          x: j++,
                          barRods: [
                            BarChartRodData(
                              width: 10,
                              toY: model,
                              color: AppColors.primBlue,
                              borderRadius: BorderRadius.circular(4),
                              backDrawRodData: BackgroundBarChartRodData(
                                color: Colors.grey[400],
                                toY: 120,
                                show: true,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
