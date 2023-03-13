import 'package:amide_app/models/elderly.dart';
import 'package:amide_app/models/reminder.dart';
import 'package:amide_app/provider/elderlyData.dart';
import 'package:amide_app/pages/create/create-elderly-page.dart';
import 'package:amide_app/pages/create/create-reminder-page.dart';
import 'package:amide_app/pages/dashboard/dashboard-page.dart';
import 'package:amide_app/pages/journal/elderly-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/pages/view/view-elderly-page.dart';
import 'package:amide_app/pages/view/view-reminder-page.dart';
import 'package:amide_app/provider/reminderData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(ElderlyAdapter());
  Hive.registerAdapter(ReminderAdapter());

  // open a box
  var reminderBox = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ElderlyData()),
        ChangeNotifierProvider(create: (context) => ReminderData()),
      ],
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "AMIDE Application",
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: "Montserrat",
          ),
          home: DashboardPage(),
        );
      }),
    );
  }
}
