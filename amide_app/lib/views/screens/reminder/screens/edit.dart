import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/views/screens/reminder/screens/reminder.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/drop_down/custom.dart';
import 'package:amide_app/views/widgets/fields/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../features/data/models/reminder/reminder.dart';

@RoutePage()
class EditReminderScreen extends StatefulWidget {
  const EditReminderScreen({
    required this.reminder,
    super.key,
  });

  final Reminder reminder;

  @override
  State<EditReminderScreen> createState() => _EditReminderScreenState();
}

class _EditReminderScreenState extends State<EditReminderScreen> {
  late String newDateTime = DateFormat.Hm().format(_dateTime);
  final DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ReminderData reminder = Provider.of<ReminderData>(context, listen: false);
      reminder.name.text = widget.reminder.name;

      reminder.detail.text = widget.reminder.detail;

      reminder.timeController.text = widget.reminder.time;
    });

    super.initState();
  }

  void pickTime() async {
    final ReminderData reminderData = Provider.of<ReminderData>(context, listen: false);

    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_dateTime),
    );

    if (newTime != null) {
      // ignore: use_build_context_synchronously
      reminderData.updateTime(newTime.format(context), newTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ReminderData reminder = Provider.of<ReminderData>(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            reminder.clearForm();
            context.pushRoute(const ReminderRoute());
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: reminder.name,
                        label: "Reminder Title",
                        hintText: "Enter Name",
                      ),
                      const SizedBox(height: 22),
                      //time textbox
                      CustomTextField(
                        readOnly: true,
                        controller: reminder.timeController,
                        label: "Time",
                        hintText: DateFormat.jm().format(_dateTime),
                        icon: GestureDetector(
                          onTap: () {
                            pickTime();
                          },
                          child: const Icon(
                            Icons.alarm,
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      //music
                      CustomDropDown(
                        item: reminder.musicList,
                        label: "Reminder Music",
                        value: reminder.music,
                        onChanged: (value) {
                          reminder.updateMusic(value);
                        },
                      ),
                      const SizedBox(height: 22),
                      //note
                      CustomTextField(
                        isRequired: false,
                        controller: reminder.detail,
                        label: "Reminder Detail",
                        hintText: "Some details here",
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                // Save reminder
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        reminder.editReminder(widget.reminder.id);

                        // Realtime().createData(
                        //   Music(
                        //     hour: reminderData.hour ?? reminderData.now.hour,
                        //     minute: reminderData.minute ?? reminderData.now.minute,
                        //     musicKey: reminderData.musicIndex,
                        //     id: id,
                        //   ),
                        // );

                        context.pushRoute(const ReminderRoute());
                      }
                    },
                    label: "Save Reminder",
                    icon: Icons.save,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
