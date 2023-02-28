import 'package:amide_app/components/drawer.dart';
import 'package:amide_app/components/reminder-tile.dart';
import 'package:amide_app/models/database.dart';
import 'package:amide_app/pages/create/create-reminder-page.dart';
import 'package:amide_app/pages/edit/edit-reminder-page.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';

<<<<<<< HEAD
class reminderPage extends StatefulWidget {
  reminderPage({super.key});

  @override
  State<reminderPage> createState() => _reminderPageState();
}

class _reminderPageState extends State<reminderPage> {
  final TextEditingController _titleController = TextEditingController();

  // reference the hive box
  final _myBox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();

  void saveTask() {
    setState(() {
      db.toDoList.add([
        "08:00Am",
        _titleController.text,
        true,
      ]);
    });
    Navigator.pop(context);
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void isActive(int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  void editTask(int index) {
    Navigator.of(context).push(
      PageTransition(
        child: editReminder(
          text: db.toDoList[index][0],
          titleController: _titleController,
          onPressed: saveTask,
        ),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }

  @override
  void initState() {
    // if this is the 1st time ever open in the app, then create default data
    // TODO: implement initState
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there are already exists data
      db.loadData();
    }
    super.initState();
  }
=======
class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});
>>>>>>> a0f1fc5fb3bb88f39201297c0fec043c73f4992b

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
          Navigator.of(context).push(
            PageTransition(
<<<<<<< HEAD
              child: createReminder(
                titleController: _titleController,
                onPressed: saveTask,
              ),
=======
              child: CreateReminder(),
>>>>>>> a0f1fc5fb3bb88f39201297c0fec043c73f4992b
              type: PageTransitionType.rightToLeft,
            ),
          );
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
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
<<<<<<< HEAD
                      itemCount: db.toDoList.length,
                      itemBuilder: ((context, index) {
                        return reminderTile(
                          onEdit: (context) => editTask(index),
                          isOn: (context) => isActive(index),
                          onDelete: (context) => deleteTask(index),
                          time: db.toDoList[index][0],
                          subtitle: db.toDoList[index][1],
                          value: db.toDoList[index][2],
                        );
                      })),
=======
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return ReminderTile();
                    })
                  ),
>>>>>>> a0f1fc5fb3bb88f39201297c0fec043c73f4992b
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
