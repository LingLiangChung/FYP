import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:jobnow_version_1/screens/admin/home/components/admin_login.dart';
import 'package:jobnow_version_1/screens/admin/home/components/body.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Icons.workspaces,
        duration: 2000,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: Body(),
      ),
    );
  }
}
