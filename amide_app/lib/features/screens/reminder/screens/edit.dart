import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/models/reminder/reminder.dart';

@RoutePage()
class EditReminderScreen extends StatefulWidget {
  final Reminder currentReminder;
  const EditReminderScreen({
    required this.currentReminder,
    super.key,
  });

  @override
  State<EditReminderScreen> createState() => _EditReminderScreenState();
}

class _EditReminderScreenState extends State<EditReminderScreen> {
  late String newName;
  late String newDetail;
  late String newTime;

  late String newDateTime = DateFormat.Hm().format(_dateTime);
  DateTime _dateTime = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.currentReminder.name;
    newName = widget.currentReminder.name;

    _detailController.text = widget.currentReminder.detail;
    newDetail = widget.currentReminder.detail;

    _timeController.text = widget.currentReminder.time;
    newTime = widget.currentReminder.time;

    super.initState();
  }

  void _editReminder() {
    Provider.of<ReminderData>(context, listen: false).editReminder(
      reminder: Reminder(
          name: newName,
          detail: newDetail,
          time: _timeController.text,
          dateTime: _dateTime),
      reminderKey: widget.currentReminder.key,
    );

    context.popRoute();
  }

  void pickTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    if (newTime == null) return;
    final newDateTime = DateTime(
      _dateTime.year,
      _dateTime.month,
      _dateTime.day,
      newTime.hour,
      newTime.minute,
    );
    setState(() {
      _dateTime = newDateTime;
      _timeController.text = newTime.format(context);
    });
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
            context.pushRoute(
              const ReminderRoute(),
            );
          },
          icon: const Icon(
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
              const SizedBox(height: 20),
              const Text(
                'Edit Reminder',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const Align(
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
                    const SizedBox(height: 5),
                    // reminder title
                    SizedBox(
                      height: 40,
                      width: width - 30,
                      child: TextFormField(
                        controller: _nameController,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Name',
                          hintStyle: const TextStyle(
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
                    const SizedBox(height: 22),
                    //time textbox
                    const Align(
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
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.bottom,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.watch_later),
                              onPressed: pickTime,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: newDateTime,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          controller: _timeController,
                          onChanged: (value) {
                            setState(() {
                              newDateTime = value;
                            });
                          }),
                    ),
                    const SizedBox(height: 22),
                    //music
                    const Align(
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
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.queue_music),
                              onPressed: () {}),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'music.wav',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    //note
                    const Align(
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
                    const SizedBox(height: 5),
                    SizedBox(
                      width: width - 30,
                      child: TextField(
                        controller: _detailController,
                        onChanged: (value) {
                          setState(() {
                            newDetail = value;
                          });
                        },
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 7,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Some details here...',
                          hintStyle: const TextStyle(
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
              const Spacer(),

              // Save reminder
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () => _editReminder(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primBlue),
                      overlayColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.save_alt,
                          size: 21,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        width > 280
                            ? const Text(
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
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
