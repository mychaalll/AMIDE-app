import 'package:amide_app/pages/create/create-journal-page.dart';
import 'package:amide_app/pages/create/create-reminder-page.dart';
import 'package:amide_app/pages/dashboard/dashboard-page.dart';
import 'package:amide_app/pages/journal/journal-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/pages/view/view-journal-page.dart';
import 'package:amide_app/pages/view/view-reminder-page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox("myBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AMIDE Application',
      theme:
          ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Montserrat'),
      home: reminderPage(),
    );
  }
}
