import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/records/blood_pressure/systolic.dart';
import 'package:amide_app/features/data/provider/vital_signs.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BloodPressureBarChart extends StatelessWidget {
  const BloodPressureBarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final VitalSignsService vitalSignsService = VitalSignsService();

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Blood Pressure",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${vitalSignsService.systolicData.last.value} / ${vitalSignsService.diastolicData.last.value} mmHg",
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
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 100,
                      minY: 0,
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      barGroups: vitalSignsService.systolicData.map((Systolic systolic) {
                        return BarChartGroupData(
                          x: systolic.id,
                          barRods: [
                            BarChartRodData(
                              toY: systolic.value,
                              color: AppColors.primBlue,
                              borderRadius: BorderRadius.circular(4),
                              backDrawRodData: BackgroundBarChartRodData(
                                color: Colors.grey[400],
                                toY: 100,
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
                Expanded(
                  child: BarChart(
                    BarChartData(
                      maxY: 100,
                      minY: 0,
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      barGroups: vitalSignsService.systolicData.map((Systolic systolic) {
                        return BarChartGroupData(
                          x: systolic.id,
                          barRods: [
                            BarChartRodData(
                              toY: systolic.value,
                              color: AppColors.primBlue,
                              borderRadius: BorderRadius.circular(4),
                              backDrawRodData: BackgroundBarChartRodData(
                                color: Colors.grey[400],
                                toY: 100,
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
