import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/presentation/dashboard/widgets/elderly_tile.dart';
import 'package:amide_app/features/data/provider/reminder_data.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/main_button.dart';
import '../widgets/topbar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String name = 'Edilberto';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    Provider.of<ReminderData>(context, listen: false).getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReminderData>(builder: (context, value, child) {
        final reminderLength = value.reminderCount;
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 11),
                    //hello user, settings icon
                    Topbar(name: name),
                    const SizedBox(height: 20),
                    //date
                    Center(
                      child: Text(
                        DateFormat('E, d MMM yyyy')
                            .format(DateTime.now())
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 27),
                    //buttons
                    SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          MainButton(
                            icon: Icons.view_list_rounded,
                            title: 'Reminders',
                            navigation: () {
                              context.pushRoute(
                                ReminderRoute(),
                              );
                            },
                          ),
                          const SizedBox(width: 13),
                          MainButton(
                            icon: Icons.elderly_sharp,
                            title: 'Elderly',
                            navigation: () {
                              context.router.push(
                                const ElderlyRoute(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 27),
                    //incoming reminders
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Incoming Reminders',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 22),
                        reminderLength == 0
                            ? const Text("Please input a reminder.")
                            : SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      reminderLength < 3 ? reminderLength : 3,
                                  itemBuilder: (context, index) {
                                    final currentReminder =
                                        value.getReminder(index);
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: Text(
                                          currentReminder.time,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        horizontalTitleGap: 50,
                                        title: Text(
                                          currentReminder.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: const Text("lorem ipmsum"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        const SizedBox(height: 22),
                        ElevatedButton(
                            onPressed: () {
                              context.pushRoute(
                                ReminderRoute(),
                              );
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primBlue),
                                overlayColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 2, 5, 27)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ))),
                            child: const SizedBox(
                              height: 40,
                              child: Center(
                                child: Text(
                                  'View Reminders',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 26),
                    //activity logs
                    Column(children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elderly Records',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 22),
                      const DashboardRecordTile(
                        name: 'John Wick',
                        temp: '37.9',
                        time: '07:00 AM',
                        bp: '120/80',
                        bpm: '80',
                        bol: '96',
                      ),
                      const SizedBox(height: 11),
                      const DashboardRecordTile(
                        name: 'Ai Hoshino',
                        temp: '35.7',
                        time: '09:00 AM',
                        bp: '90/80',
                        bpm: '85',
                        bol: '98',
                      ),
                      const SizedBox(height: 11),
                      const DashboardRecordTile(
                        name: 'Juan Dela Cruz',
                        temp: '38.5',
                        time: '03:00 PM',
                        bp: '110/80',
                        bpm: '99',
                        bol: '96',
                      ),
                      const SizedBox(height: 22),
                      ElevatedButton(
                          onPressed: () {
                            context.pushRoute(
                              const ElderlyRoute(),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primBlue),
                              overlayColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 2, 5, 27)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ))),
                          child: const SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                'View Elderly List',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ]),
                    const SizedBox(height: 20),
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
