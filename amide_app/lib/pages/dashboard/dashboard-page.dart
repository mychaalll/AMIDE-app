import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dashboardPage extends StatelessWidget {
  dashboardPage({super.key});
  String name = 'Edilberto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      DateFormat('E, d MMM yyyy').format(DateTime.now()).toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black
                      ),
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
                      ),
                      SizedBox(width: 13),
                      mainButton(
                        icon: Icons.not_listed_location_rounded,
                        title: 'Logs',
                      ),
                      SizedBox(width: 13),
                      mainButton(
                        icon: Icons.elderly_sharp,
                        title: 'Patients',
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
                            color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      reminderTile(
                        time: '09:00 AM',
                        title: 'Reminder Title 1',
                        details: 'Proident et dolore qui proident laboris ex..',
                      ),
                      SizedBox(height: 11),
                      reminderTile(
                        time: '12:00 PM',
                        title: 'Reminder Title 2',
                        details: 'Proident et dolore qui proident laboris ex..',
                      ),
                      SizedBox(height: 11),
                      reminderTile(
                        time: '06:00 PM',
                        title: 'Reminder Title 3',
                        details: 'Proident et dolore qui proident laboris ex..',
                      ),
                      SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
                          overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 5, 27)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          )
                        ),
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
                        )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 26),
                //activity logs
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Activity Logs',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      activityTile(
                        location: 'Kitchen Area',
                        time: '07:00 AM',
                      ),
                      SizedBox(height: 11),
                      activityTile(
                        location: 'Home Entrance',
                        time: '09:00 AM',
                      ),
                      SizedBox(height: 11),
                      activityTile(
                        location: 'Kitchen Area',
                        time: '03:00 PM',
                      ),
                      SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
                          overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 5, 27)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          )
                        ),
                        child: Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              'View Logs',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      )
                    ]
                  )
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class activityTile extends StatelessWidget {
  final String location, time;
  activityTile({
    Key? key, required this.location, required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Potential Accident Detected',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      color: Colors.black
                    ),
                  ),
                  Text(
                    'At ' + location,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Colors.black
                    ),
                  ),
                  
                ],
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Montserrat',
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class reminderTile extends StatelessWidget {
  final String time, title, details;

  reminderTile({
    Key? key, required this.time, required this.title, required this.details,
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
              color: Colors.black
            ),
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
                padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 9),
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
                        color: Colors.black
                      ),
                    ),
                    Text(
                      details,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        color: Colors.black
                      ),
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

  const mainButton({
    Key? key, required this.icon, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primBlue,
          borderRadius: BorderRadius.circular(15)
        ),
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
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}

class topBar extends StatelessWidget {
  String name;

  topBar({
    Key? key, required this.name
  }) : super(key: key);

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
                color: Colors.black
              ),
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
                color: Colors.black
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            
          },
          icon: Icon(
            Icons.settings,
            size: 23,
            color: Colors.black,
          )

        ),
      ],
    );
  }
}

