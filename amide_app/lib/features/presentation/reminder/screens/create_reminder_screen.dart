import 'dart:io';

import 'package:amide_app/features/data/provider/reminderData.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../data/models/reminder.dart';

@RoutePage()
class CreateReminderScreen extends StatefulWidget {
  CreateReminderScreen({
    super.key,
  });

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _detailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FilePickerResult? result;
  PlatformFile? pickedFile;
  File? fileToDisplay;

  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _timeController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  void _addReminder() {
    Provider.of<ReminderData>(context, listen: false).addReminder(
      Reminder(
        time: _timeController.text,
        name: _nameController.text,
        detail: _detailController.text,
      ),
    );
    context.popRoute();
  }

  void pickTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    if (newTime != null) {
      setState(() {
        _timeController.text = newTime.format(context);
      });
    }
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // open single file
    final file = result.files.first;
    // openFile(file);

    final newFile = await saveFilePermanently(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");

    return File(file.path!).copy(newFile.path);
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
            context.popRoute();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SafeArea(
          child: Container(
            color: AppColors.bgColor,
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
                                return "Please enter some value";
                              }
                              return null;
                            },
                            controller: _nameController,
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
                            controller: _timeController,
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
                            controller: _detailController,
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
                    onPressed: _addReminder,
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
