import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/models/reminder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReminderTile extends StatelessWidget {
  const ReminderTile({
    Key? key,
    required this.reminder,
  }) : super(key: key);

  final Reminder reminder;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = reminder.dateTime.toDate();
    final String date = DateFormat("MMMM dd, yyyy hh:mm").format(dateTime);
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    reminder.name,
                    style: TextStyle(
                      color: CustomColor.primBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimen.defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(date)],
            ),
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
              child: Text(reminder.detail),
            ),
          ],
        ),
      ),
    );
  }
}
