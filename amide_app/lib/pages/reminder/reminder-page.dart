import 'package:amide_app/components/drawer.dart';
import 'package:amide_app/components/reminder-tile.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        title: Text(
          'Reminder',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Colors.white
          ),
        )
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primBlue,
        foregroundColor: Colors.white,
        label: Text('Add Reminder'),
        icon: Icon(Icons.person_add_alt_1_rounded),
        onPressed: () {
        },
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            color: AppColors.bgColor,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Reminder List',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return ReminderTile();
                    })
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}