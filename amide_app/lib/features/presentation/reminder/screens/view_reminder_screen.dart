import 'package:amide_app/features/presentation/reminder/screens/edit_reminder_screen.dart';
import 'package:amide_app/features/presentation/reminder/screens/reminder_screen.dart';
import 'package:amide_app/features/data/provider/reminderData.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../data/models/reminder.dart';

class ViewReminderScreen extends StatelessWidget {
  ViewReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

    var width = MediaQuery.of(context).size.width;
    return Consumer<ReminderData>(
      builder: ((context, value, child) {
        Reminder currentReminder = value.getActiveReminder();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppColors.primBlue,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: ReminderScreen(),
                    type: PageTransitionType.leftToRight,
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: EditReminderScreen(
                        currentReminder: currentReminder,
                      ),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Container(
              color: AppColors.bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'View Reminder',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reminder Title',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: currentReminder.name,
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    //time textbox
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: currentReminder.time,
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    //music
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reminder Music',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(Icons.queue_music), onPressed: () {}),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Music",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    //note
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reminder Details',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        width: width - 30,
                        child: TextField(
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.bottom,
                          maxLines: 10,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: currentReminder.detail,
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
