import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'tile.dart';

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
