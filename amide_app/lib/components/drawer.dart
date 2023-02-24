import 'package:amide_app/pages/dashboard/dashboard-page.dart';
import 'package:amide_app/pages/journal/journal-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 245, 242, 242),
      child: Container(
        child: ListView(
          children: [
            Container(
              color: AppColors.primBlue,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'AMIDE',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            drawerTile(
              icon: Icons.dashboard,
              title: 'Dashboard',
              navigation: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: dashboardPage(),
                    type: PageTransitionType.leftToRight,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            drawerTile(
              icon: Icons.view_list_rounded,
              title: 'Reminders',
              navigation: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: reminderPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            drawerTile(
              icon: Icons.not_listed_location_rounded,
              title: 'Logs',
              navigation: () {},
            ),
            SizedBox(height: 10),
            drawerTile(
              icon: Icons.elderly_sharp,
              title: 'Elderly',
              navigation: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: elderlyPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(height: 10.0),
            Container(height: 1.0, color: Colors.grey[600]),
            SizedBox(height: 10.0),
            drawerTile(
              icon: Icons.settings,
              title: 'Settings',
              navigation: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class drawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? navigation;
  const drawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        selectedColor: AppColors.primBlue,
        selectedTileColor: AppColors.primBlue.withOpacity(0.1),
        leading: Icon(
          icon,
          size: 35,
          color: Colors.black,
        ),
        minLeadingWidth: 40,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: navigation);
  }
}
