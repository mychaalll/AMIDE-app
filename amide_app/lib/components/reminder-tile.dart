import 'package:amide_app/models/reminder.dart';
import 'package:amide_app/pages/edit/edit-reminder-page.dart';
import 'package:amide_app/pages/view/view-reminder-page.dart';
import 'package:amide_app/provider/reminderData.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:amide_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../pages/create/create-reminder-page.dart';
import '../pages/view/view-elderly-page.dart';

class ReminderTile extends StatefulWidget {
  final int tileIndex;
  ReminderTile({
    Key? key,
    required this.tileIndex,
  }) : super(key: key);

  @override
  State<ReminderTile> createState() => _ReminderTileState();
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
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  // go to Edit
                  Log.d("Selected to edit");
                  Navigator.of(context).push(
                    PageTransition(
                      child: EditReminder(
                        currentReminder: currentReminder,
                      ),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              )
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: DrawerMotion(),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: ViewReminder(),
                    type: PageTransitionType.rightToLeft,
                  ),
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
                        SizedBox(width: 30),
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
                        SizedBox(width: 15),
                        Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Color.fromARGB(255, 20, 44, 223),
                          inactiveThumbColor: Colors.grey[500],
                          inactiveTrackColor: Color.fromARGB(255, 10, 23, 119),
                          value: _value,
                          onChanged: ((newValue) {
                            setState(() {
                              _value = newValue;
                            });
                          }),
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
