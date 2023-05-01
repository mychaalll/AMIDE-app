import 'package:amide_app/features/presentation/elderly/screens/elderly_screen.dart';
import 'package:amide_app/features/presentation/reminder/screens/reminder_screen.dart';
import 'package:amide_app/features/data/provider/reminderData.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

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
                    topBar(name: name),
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
                          mainButton(
                            icon: Icons.view_list_rounded,
                            title: 'Reminders',
                            navigation: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: ReminderScreen(),
                                  type: PageTransitionType.rightToLeft,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 13),
                          mainButton(
                            icon: Icons.elderly_sharp,
                            title: 'Elderly',
                            navigation: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: ElderlyScreen(),
                                  type: PageTransitionType.rightToLeft,
                                ),
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
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: ReminderScreen(),
                                    type: PageTransitionType.rightToLeft,
                                  ),
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
                      elderlyTile(
                        name: 'John Wick',
                        temp: '37.9',
                        time: '07:00 AM',
                        bp: '120/80',
                        bpm: '80',
                        bol: '96',
                      ),
                      SizedBox(height: 11),
                      elderlyTile(
                        name: 'Ai Hoshino',
                        temp: '35.7',
                        time: '09:00 AM',
                        bp: '90/80',
                        bpm: '85',
                        bol: '98',
                      ),
                      SizedBox(height: 11),
                      elderlyTile(
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
                            Navigator.of(context).push(
                              PageTransition(
                                child: ElderlyScreen(),
                                type: PageTransitionType.rightToLeft,
                              ),
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

class elderlyTile extends StatelessWidget {
  final name, temp, time, bp, bpm, bol;
  elderlyTile({
    Key? key,
    required this.temp,
    required this.time,
    required this.bpm,
    required this.bp,
    required this.bol,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 10.0),
            //2nd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.thermostat_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$temp° Celcius',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 40),
                      Icon(
                        Icons.monitor_heart_outlined,
                        color: Colors.purple,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$bp mmHg',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //3rd row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$bpm BPM',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(width: 40),
                      Icon(
                        Icons.water_drop_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$bol% SpO2',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderTile extends StatelessWidget {
  late String time, title, details;

  ReminderTile({
    Key? key,
    required this.time,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Montserrat',
                color: Colors.black),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Colors.black),
                    ),
                    Text(
                      details,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class mainButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? navigation;

  const mainButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: navigation,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
            overlayColor:
                MaterialStateProperty.all(Color.fromARGB(255, 2, 5, 27)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  String name;

  topBar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
            SizedBox(height: 7),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 23,
              color: Colors.black,
            )),
      ],
    );
  }
}
