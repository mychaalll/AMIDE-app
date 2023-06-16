import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/services/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardServices dashboard = Provider.of<DashboardServices>(context);

    return Drawer(
      backgroundColor: CustomColor.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ListTile(
              title: Text("Admin 1"),
              subtitle: Text("Care taker"),
              leading: Icon(
                CupertinoIcons.person_crop_circle,
              ),
            ),
            const Divider(),
            SizedBox(height: Dimen.defaultPadding * 0.2),
            ListTile(
              onTap: () => dashboard.updateBodyScreen(0),
              title: const Text("Dashboard"),
              leading: const Icon(CupertinoIcons.home),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimen.defaultPadding * 0.2),
              child: const Divider(),
            ),
            ListTile(
              onTap: () => dashboard.updateBodyScreen(1),
              title: const Text("Reminder"),
              leading: const Icon(CupertinoIcons.square_favorites_alt_fill),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimen.defaultPadding * 0.2),
              child: const Divider(),
            ),
            ListTile(
              onTap: () => dashboard.updateBodyScreen(2),
              title: const Text("Statistics"),
              leading: const Icon(CupertinoIcons.doc_circle_fill),
            ),
          ],
        ),
      ),
    );
  }
}
