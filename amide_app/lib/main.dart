import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/routes/routes.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        ChangeNotifierProvider(create: (context) => ElderlyData()),
        ChangeNotifierProvider(create: (context) => ReminderData()),
        ChangeNotifierProvider(create: (context) => RecordServices()),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "AMIDE Application",
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            fontFamily: "Montserrat",
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primBlue,
            ),
          ),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
