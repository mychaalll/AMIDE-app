import 'package:admin/models/elderly.dart';
import 'package:admin/services/dashboard.dart';
import 'package:admin/services/database.dart';
import 'package:admin/views/screens/desktop/dashboard.dart';
import 'package:admin/views/screens/desktop/reminder.dart';
import 'package:admin/views/screens/desktop/statistics.dart';
import 'package:admin/views/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  late Stream<List<Elderly>> getElderly;

  @override
  void initState() {
    getElderly = DatabaseServices().getElderly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DashboardServices dashboard = Provider.of<DashboardServices>(context);

    final List bodyList = [
      const DesktopDashboardScreen(),
      const DesktopReminderScreen(),
      const DescktopStatScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Desktop Dashboard"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomDrawer(),
          bodyList[dashboard.bodyScreenIndex],
        ],
      ),
    );
  }
}
