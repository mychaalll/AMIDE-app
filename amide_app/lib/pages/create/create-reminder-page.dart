import 'dart:io';

import 'package:amide_app/utils/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../reminder/reminder-page.dart';

class CreateReminder extends StatefulWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController reminderController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  VoidCallback onPressed;
  CreateReminder({
    super.key,
    required this.formKey,
    required this.onPressed,
    required this.titleController,
    required this.timeController,
  });

  @override
  State<CreateReminder> createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder> {

  FilePickerResult? result;
  PlatformFile? pickedFile;
  String? _fileName;
  bool _isLoading = false;
  File? fileToDisplay;

  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    widget.titleController.dispose();
    widget.timeController.dispose();
    widget.reminderController.dispose();
    super.dispose();
  }

  void pickTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    if (newTime != null) {
      setState(() {
        widget.timeController.text = newTime.format(context);
      });
    }
  }

  void pickFile() async {
    try {
      setState(() {
        _isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      setState(() {
        _isLoading = false;
      });

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(
          pickedFile!.path.toString(),
        );

        print("File name: $_fileName");
      }
    } catch (e) {
      print(e);
    }
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
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Add Reminder',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reminder Title',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5),
                        // reminder title
                        Container(
                          height: 40,
                          width: width - 30,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The name is empty";
                              } else {
                                return null;
                              }
                            },
                            controller: widget.titleController,
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
                          ),
                        ),
                        SizedBox(height: 22),
                        //time textbox
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 40,
                          width: width - 30,
                          child: TextField(
                            controller: widget.timeController,
                            readOnly: true,
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
                                onPressed: pickTime,
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
                              hintText: DateFormat.jm().format(_dateTime),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        //music
                        Text(
                          'Reminder Music',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
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
                                onPressed: pickFile,
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
                        Text(
                          'Reminder Detail',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: width - 30,
                          child: TextField(
                            controller: widget.reminderController,
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.bottom,
                            maxLines: 7,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
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
                    onPressed: widget.onPressed,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primBlue),
                        overlayColor: MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }
}
