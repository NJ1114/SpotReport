import 'package:flutter/material.dart';
import 'package:mvp/screens/login_screens/login.dart';
import 'package:mvp/screens/report_screen/reporting.dart';

class SpotReport extends StatefulWidget {
  const SpotReport({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpotReport();
  }
}

class _SpotReport extends State<SpotReport> {
  Widget? activeScreen;

  // to initialise state like a priority
  @override
  void initState() {
    activeScreen = UserLoginScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const ReportingScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen
      ),
    );
  }
}
