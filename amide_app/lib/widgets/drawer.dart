import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 2, 4, 22),
      child: ListView(
        children: [
          Container(
            color: const Color.fromARGB(255, 2, 4, 22),
            child: const DrawerHeader(
              child: Center(
                child: Text(
                  'AMIDE',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 30, fontFamily: 'Montserrat', color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DrawerTile(
            icon: Icons.dashboard,
            title: 'Dashboard',
            navigation: () {
              context.pushRoute(
                const DashboardRoute(),
              );
            },
          ),
          const SizedBox(height: 10),
          DrawerTile(
            icon: Icons.view_list_rounded,
            title: 'Reminders',
            navigation: () {
              context.pushRoute(
                const ReminderRoute(),
              );
            },
          ),
          const SizedBox(height: 10),
          DrawerTile(
            icon: Icons.elderly_sharp,
            title: 'Elderly',
            navigation: () {
              context.pushRoute(
                const ElderlyRoute(),
              );
            },
          ),
          const SizedBox(height: 10.0),
          Container(height: 1.0, color: Colors.grey[600]),
          const SizedBox(height: 10.0),
          DrawerTile(
            icon: Icons.settings,
            title: 'Settings',
            navigation: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? navigation;
  const DrawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
          selectedColor: AppColors.primBlue,
          selectedTileColor: AppColors.primBlue.withOpacity(0.1),
          leading: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          minLeadingWidth: 40,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: navigation),
    );
  }
}
