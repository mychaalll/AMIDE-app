import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/models/reminder.dart';
import 'package:admin/services/database.dart';
import 'package:admin/views/widgets/tile/reminder.dart';
import 'package:flutter/material.dart';

class DesktopReminderScreen extends StatefulWidget {
  const DesktopReminderScreen({Key? key}) : super(key: key);

  @override
  State<DesktopReminderScreen> createState() => _DesktopReminderScreenState();
}

class _DesktopReminderScreenState extends State<DesktopReminderScreen> {
  late Stream<List<Reminder>> getReminder;

  @override
  void initState() {
    getReminder = DatabaseServices().getReminder();
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
            StreamBuilder<List<Reminder>>(
              stream: getReminder,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  final reminder = snapshot.data!;
                  if (snapshot.hasData) {
                    return Wrap(
                      children: reminder.map((Reminder reminder) {
                        return ReminderTile(
                          reminder: reminder,
                        );
                      }).toList(),
                    );
                    // return const Wrap(
                    //   crossAxisAlignment: WrapCrossAlignment.start,
                    //   children: [
                    //     ReminderTile(),
                    //   ],
                    // );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else {
                    return const Text("Reminder has no data");
                  }
                }
                return Text('State: ${snapshot.connectionState}');
              },
            )
          ],
        ),
      ),
    );
  }
}
