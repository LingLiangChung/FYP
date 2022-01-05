import 'package:flutter/material.dart';
import 'package:jobnow_version_1/constants.dart';
import 'package:jobnow_version_1/screens/admin/home/components/admin_login.dart';
import 'package:jobnow_version_1/screens/admin/home/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'screens/loading/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobNow',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        splash: Icons.workspaces,
        duration: 3000,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: AdminLogin(),
      ),
    );
  }
}

