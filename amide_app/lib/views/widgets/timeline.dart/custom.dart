import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeline extends StatelessWidget {
  const CustomTimeline({
    Key? key,
    this.isLast = false,
    this.isFirst = true,
    this.isDone = false,
    required this.content,
  }) : super(key: key);

  final bool isLast;
  final bool isFirst;
  final bool isDone;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      alignment: TimelineAlign.manual,
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.5,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: Container(
          decoration: BoxDecoration(
            color: isDone ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isDone ? Icons.done : Icons.more_horiz,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      lineXY: 0,
      endChild: content,
    );
  }
}
