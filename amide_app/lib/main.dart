import 'package:amide_app/core/routes/routes.dart';
import 'package:amide_app/features/data/provider/elderlyData.dart';
import 'package:amide_app/features/data/provider/reminderData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'features/data/models/elderly.dart';
import 'features/data/models/reminder.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(ElderlyAdapter());
  Hive.registerAdapter(ReminderAdapter());

  // open a box
  var reminderBox = await Hive.openBox("myBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ElderlyData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReminderData(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "AMIDE Application",
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: "Montserrat",
          ),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
