import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/presentation/dashboard/widgets/elderly_tile.dart';
import 'package:amide_app/features/data/provider/reminderData.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/main_button.dart';
import '../widgets/topbar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

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
        final _reminderLength = value.reminderCount;
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 11),
                    //hello user, settings icon
                    Topbar(name: name),
                    SizedBox(height: 20),
                    //date
                    Container(
                      child: Center(
                        child: Text(
                          DateFormat('E, d MMM yyyy')
                              .format(DateTime.now())
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 27),
                    //buttons
                    Container(
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
                          SizedBox(width: 13),
                          MainButton(
                            icon: Icons.elderly_sharp,
                            title: 'Elderly',
                            navigation: () {
                              context.router.push(
                                ElderlyRoute(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 27),
                    //incoming reminders
                    Container(
                      child: Column(
                        children: [
                          Align(
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
                          SizedBox(height: 22),
                          _reminderLength == 0
                              ? Container(
                                  child: Text("Please input a reminder."),
                                )
                              : SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: _reminderLength < 3
                                        ? _reminderLength
                                        : 3,
                                    itemBuilder: (context, index) {
                                      final _currentReminder =
                                          value.getReminder(index);
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ListTile(
                                          leading: Text(
                                            "${_currentReminder.time}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          horizontalTitleGap: 50,
                                          title: Text(
                                            "${_currentReminder.name}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                          subtitle: Text("lorem ipmsum"),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(height: 22),
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
                                      Color.fromARGB(255, 2, 5, 27)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ))),
                              child: Container(
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
                    ),
                    SizedBox(height: 26),
                    //activity logs
                    Container(
                        child: Column(children: [
                      Align(
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
                      SizedBox(height: 22),
                      DashboardRecordTile(
                        name: 'John Wick',
                        temp: '37.9',
                        time: '07:00 AM',
                        bp: '120/80',
                        bpm: '80',
                        bol: '96',
                      ),
                      SizedBox(height: 11),
                      DashboardRecordTile(
                        name: 'Ai Hoshino',
                        temp: '35.7',
                        time: '09:00 AM',
                        bp: '90/80',
                        bpm: '85',
                        bol: '98',
                      ),
                      SizedBox(height: 11),
                      DashboardRecordTile(
                        name: 'Juan Dela Cruz',
                        temp: '38.5',
                        time: '03:00 PM',
                        bp: '110/80',
                        bpm: '99',
                        bol: '96',
                      ),
                      SizedBox(height: 22),
                      ElevatedButton(
                          onPressed: () {
                            context.pushRoute(
                              ElderlyRoute(),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primBlue),
                              overlayColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 2, 5, 27)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ))),
                          child: Container(
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
                    ])),
                    SizedBox(height: 20),
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
