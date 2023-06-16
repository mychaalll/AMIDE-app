import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/views/widgets/tile/reminder.dart';
import 'package:flutter/material.dart';

class DesktopReminderScreen extends StatefulWidget {
  const DesktopReminderScreen({Key? key}) : super(key: key);

  @override
  State<DesktopReminderScreen> createState() => _DesktopReminderScreenState();
}

class _DesktopReminderScreenState extends State<DesktopReminderScreen> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(Dimen.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reminder Records",
              style: TextStyle(
                color: CustomColor.primBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimen.defaultPadding),
            const Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                ReminderTile(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
