import 'package:admin/core/theme/theme.dart';
import 'package:admin/firebase_options.dart';
import 'package:admin/services/dashboard.dart';
import 'package:admin/services/login.dart';
import 'package:admin/views/screens/desktop/dashboard.dart';
import 'package:admin/views/screens/desktop/home.dart';
import 'package:admin/views/screens/desktop/login/login.dart';
import 'package:admin/views/screens/mobile/dashboard.dart';
import 'package:admin/views/screens/responsive_layout.dart';
import 'package:admin/views/screens/tablet/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardServices()),
        ChangeNotifierProvider(create: (context) => LoginServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DesktopLoginScreen.route,
        theme: CustomTheme.data,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            if (settings.name == DesktopDashboardScreen.route) {
              return const DesktopDashboardScreen();
            } else if (settings.name == DesktopHomeScreen.route) {
              return const DesktopHomeScreen();
            } else {
              return ResponsiveLayout(
                mobileScaffold: const MobileDashboardScreen(),
                tabletScaffold: const TabletDashboardScreen(),
                desktopScaffold: DesktopLoginScreen(),
              );
            }
          });
        },
      ),
    );
  }
}
