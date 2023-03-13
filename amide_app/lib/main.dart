import 'package:amide_app/models/elderly.dart';
import 'package:amide_app/models/elderlyData.dart';
import 'package:amide_app/pages/create/create-elderly-page.dart';
import 'package:amide_app/pages/create/create-reminder-page.dart';
import 'package:amide_app/pages/dashboard/dashboard-page.dart';
import 'package:amide_app/pages/journal/elderly-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/pages/view/view-elderly-page.dart';
import 'package:amide_app/pages/view/view-reminder-page.dart';
import 'package:amide_app/provider/todolist.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(ElderlyAdapter());

  // open a box
  var reminderBox = await Hive.openBox("myBox");
  var elderlyBox = await Hive.openBox<Elderly>('elderly');

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
      // builder: (context, child) => MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'AMIDE Application',
      //   theme:
      //       ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Montserrat'),
      //   home: DashboardPage(),
      // ),
    );
  }
}
