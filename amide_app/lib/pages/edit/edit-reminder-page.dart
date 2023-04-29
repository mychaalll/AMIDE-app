import 'package:amide_app/models/reminder.dart';
import 'package:amide_app/provider/reminderData.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../utils/toast.dart';
import '../reminder/reminder-page.dart';

class EditReminder extends StatefulWidget {
  Reminder currentReminder;
  EditReminder({
    required this.currentReminder,
    super.key,
  });

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  late String newName;
  late String newDetail;

  late String newDateTime = DateFormat.Hm().format(_dateTime);
  DateTime _dateTime = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _detailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentReminder.name;
    newName = widget.currentReminder.name;

    _detailController.text = widget.currentReminder.detail;
    newDetail = widget.currentReminder.detail;

    super.initState();
  }

  void _editReminder(context) {
    if (newName == null) {
      toastWidget("Give entry a name");
      return;
    }

    Provider.of<ReminderData>(context, listen: false).editReminder(
      reminder: Reminder(
        name: newName,
        detail: newDetail,
        time: newDateTime,
      ),
      reminderKey: widget.currentReminder.key,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: ReminderPage(),
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
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Edit Reminder',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Column(
                    children: [
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
                      // reminder title
                      Container(
                        height: 40,
                        width: width - 30,
                        child: TextFormField(
                          controller: _nameController,
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
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              newName = value;
                            });
                          },
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
                            suffixIcon: IconButton(
                              icon: Icon(Icons.watch_later),
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  setState(() {
                                    _timeOfDay = value!;
                                    newDateTime =
                                        _timeOfDay.format(context).toString();
                                  });
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: newDateTime,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller: TextEditingController(text: newDateTime),
                          onChanged: (value) {},
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
                                icon: Icon(Icons.queue_music),
                                onPressed: () {}),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'music.wav',
                            hintStyle: TextStyle(
                              color: Colors.grey,
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
                          'Reminder Detail',
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
                        width: width - 30,
                        child: TextField(
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.bottom,
                          maxLines: 7,
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
                            hintText: 'Some details here...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),

              // Save reminder
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () => _editReminder(context),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primBlue),
                      overlayColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.save_alt,
                          size: 21,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        width > 280
                            ? Text(
                                'Save Reminder',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
