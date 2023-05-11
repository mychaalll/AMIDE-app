import 'package:amide_app/core/routes/routes.dart';
import 'package:amide_app/features/data/provider/elderly_data.dart';
import 'package:amide_app/features/data/provider/reminder_data.dart';
import 'package:amide_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'features/data/models/elderly.dart';
import 'features/data/models/reminder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(ElderlyAdapter());
  Hive.registerAdapter(ReminderAdapter());

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
