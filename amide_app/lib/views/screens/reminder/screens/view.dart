import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/models/reminder/reminder.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/views/widgets/fields/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ViewReminderScreen extends StatefulWidget {
  const ViewReminderScreen({
    super.key,
    required this.reminder,
  });

  final Reminder reminder;

  @override
  State<ViewReminderScreen> createState() => _ViewReminderScreenState();
}

class _ViewReminderScreenState extends State<ViewReminderScreen> {
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

  @override
  Widget build(BuildContext context) {
    final ReminderData reminder = Provider.of<ReminderData>(context);
 
    return GestureDetector(
      onTap: () => Focus.of(context).requestFocus(FocusNode()),
      child: Consumer<ReminderData>(
        builder: ((context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: AppColors.primBlue,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  reminder.clearForm();
                  context.popRoute();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.pushRoute(
                      EditReminderRoute(
                        reminder: widget.reminder,
                      ),
                    );
                  },
                  icon: const Icon(
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
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'View Reminder',
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
                            readOnly: true,
                          ),
                          const SizedBox(height: 22),
                          //time textbox
                          CustomTextField(
                            controller: reminder.timeController,
                            label: "Time",
                            hintText: reminder.timeController.text,
                            icon: const Icon(
                              Icons.alarm,
                            ),
                            readOnly: true,
                          ),
                          const SizedBox(height: 22),
                          //music
                          CustomTextField(
                            label: "Reminder Music",
                            hintText: reminder.music ?? "",
                            controller: TextEditingController(text: reminder.music),
                            readOnly: true,
                          ),
                          const SizedBox(height: 22),
                          //note
                          CustomTextField(
                            readOnly: true,
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

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
