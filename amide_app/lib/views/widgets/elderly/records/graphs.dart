import 'package:amide_app/features/data/models/records/graph.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/views/widgets/elderly/records/bar_chart/bar_chart.dart';
import 'package:amide_app/views/widgets/elderly/records/line_chart/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElderlyGraphs extends StatelessWidget {
  const ElderlyGraphs({
    Key? key,
    required this.graph,
    required this.title,
    required this.detail,
    required this.date,
  }) : super(key: key);

  final Graph graph;
  final String title;
  final String detail;
  final String date;

  @override
  Widget build(BuildContext context) {
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context);

    return Container(
      height: 300,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4),
            blurRadius: 4,
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
            child: elderlyData.isBar
                ? RecordsBarChart(
                    graph: graph,
                  )
                : RecordsLineChart(
                    graph: graph,
                  ),
          ),
        ],
      ),
    );
  }
}
