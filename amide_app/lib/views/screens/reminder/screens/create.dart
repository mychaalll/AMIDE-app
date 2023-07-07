import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/drop_down/custom.dart';
import 'package:amide_app/views/widgets/fields/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CreateReminderScreen extends StatefulWidget {
  const CreateReminderScreen({
    super.key,
  });

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {
  final DateTime _dateTime = DateTime.now();

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ReminderData reminderData = Provider.of<ReminderData>(context);

    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.primBlue,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.popRoute();
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
                    'Add Reminder',
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
                          controller: reminderData.name,
                          label: "Reminder Title",
                          hintText: "Enter Name",
                        ),
                        const SizedBox(height: 22),
                        //time textbox
                        CustomTextField(
                          readOnly: true,
                          controller: reminderData.timeController,
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
                          item: reminderData.musicList,
                          label: "Reminder Music",
                          value: reminderData.music,
                          onChanged: (value) {
                            reminderData.updateMusic(value);
                          },
                        ),
                        const SizedBox(height: 22),
                        //note
                        CustomTextField(
                          isRequired: false,
                          controller: reminderData.detail,
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
                          reminderData.createReminder();
                          context.popRoute();
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
      ),
    );
  }
}
