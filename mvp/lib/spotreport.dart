import 'package:flutter/material.dart';
import 'package:mvp/screens/login_screens/login_register.dart';
import 'package:mvp/screens/report_screen/reporting.dart';
import 'package:mvp/widgets/navigation_bar.dart';

class SpotReport extends StatefulWidget {
  const SpotReport({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpotReport();
  }
}

class _SpotReport extends State<SpotReport> {
  bool isLoggedIn = false;

  //--- Changes state for login process ---
  void switchScreen() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: isLoggedIn
          ? BottomNavBar() // Checks if login is true open to home, if not open to login screen
          : Scaffold(
              body: Container(
                color: const Color(0xFFEEF0F2),
                child: UserLoginScreen(switchScreen),
              ),
            ),
    );
  }
}
