import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(Dimen.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "hi",
            style: TextStyle(
              color: CustomColor.primBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Dimen.defaultPadding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Datetime"),
              Text("Music"),
            ],
          ),
          SizedBox(height: Dimen.defaultPadding),
          const Text("Details"),
          SizedBox(height: Dimen.defaultPadding),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(Dimen.defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: CustomColor.borderColor.withOpacity(0.3),
              ),
              color: Colors.white,
            ),
            child: const Text(
                "DetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetailsDetails"),
          ),
        ],
      ),
    );
  }
}
