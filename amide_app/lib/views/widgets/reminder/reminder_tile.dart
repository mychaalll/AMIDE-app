import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/config/utils.dart';
import 'package:amide_app/features/data/services/local_notifications.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../features/data/models/reminder/reminder.dart';

class ReminderTile extends StatefulWidget {
  final int tileIndex;
  const ReminderTile({
    Key? key,
    required this.tileIndex,
  }) : super(key: key);

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

void enableNotification(Reminder reminder) async {
  DateTime dateTime = reminder.dateTime;
  Time time = Time(dateTime.hour, dateTime.minute);
  await NotificationService().updateDailyNotification(
      notificationTime: time,
      id: reminder.key,
      title: reminder.name,
      body: reminder.detail);
  Log.i("ENABLED REMINDER FOR ID ${reminder.key}");
  Log.i("ENABLED REMINDER FOR TITLE ${reminder.name}");
  Log.i("ENABLED REMINDER FOR DETAILS ${reminder.detail}");
  Log.i("ENABLED REMINDER FOR TIME ${reminder.time}");
}

void disableNotification(Reminder reminder) async {
  Log.i("DISABLED REMINDER FOR ID ${reminder.key}");
  Log.i("DISABLED REMINDER FOR TITLE ${reminder.name}");
  Log.i("DISABLED REMINDER FOR DETAILS ${reminder.detail}");
  Log.i("DISABLED REMINDER FOR TIME ${reminder.time}");
  await NotificationService().cancelNotification(id: reminder.key);
}

class _ReminderTileState extends State<ReminderTile> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReminderData>(builder: (context, value, child) {
      Reminder currentReminder = value.getReminder(widget.tileIndex);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Slidable(
          closeOnScroll: true,
          startActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  // go to Edit
                  Log.d("Selected to edit");

                  context.pushRoute(
                    EditReminderRoute(
                      currentReminder: currentReminder,
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              )
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  Log.d("Deleting ${currentReminder.name}");
                  Provider.of<ReminderData>(context, listen: false)
                      .deleteReminder(currentReminder.key);
                }, //delete function
                icon: Icons.delete_forever,
                label: 'Delete',
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                context.pushRoute(
                  const ViewReminderRoute(),
                );
                Provider.of<ReminderData>(context, listen: false)
                    .setActiveReminder(currentReminder.key);
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.task,
                          color:
                              _value == true ? Colors.white : Colors.grey[500],
                          size: 25,
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                currentReminder.time,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: _value == true
                                      ? Colors.white
                                      : Colors.grey[500],
                                ),
                              ),
                              Text(
                                currentReminder.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: _value == true
                                      ? Colors.white
                                      : Colors.grey[500],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor:
                              const Color.fromARGB(255, 20, 44, 223),
                          inactiveThumbColor: Colors.grey[500],
                          inactiveTrackColor:
                              const Color.fromARGB(255, 10, 23, 119),
                          value: _value,
                          onChanged: (newValue) {
                            setState(() {
                              _value = newValue;
                            });

                            if (_value) {
                              enableNotification(
                                  currentReminder); // Enable notification when the switch is toggled on
                            } else {
                              disableNotification(
                                  currentReminder); // Cancel notification when the switch is toggled off
                            }
                          },
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
