import 'package:admin/models/graph.dart';
import 'package:admin/views/widgets/graph/bar.dart';
import 'package:flutter/material.dart';

class ElderlyGraphs extends StatelessWidget {
  const ElderlyGraphs({
    Key? key,
    required this.graph,
    required this.title,
    required this.detail,
  }) : super(key: key);

  final Graph graph;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
          Expanded(
              child: RecordsBarChart(
            graph: graph,
          )),
        ],
      ),
    );
  }
}
