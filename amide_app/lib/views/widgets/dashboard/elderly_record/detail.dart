import 'package:flutter/material.dart';

class ElderlyVitalRecordDetail extends StatelessWidget {
  const ElderlyVitalRecordDetail({
    super.key,
    required this.label,
    required this.iconData,
  });

  final String label;
  final Icon iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          iconData,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
