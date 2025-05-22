import 'package:flutter/material.dart';
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
    return Scaffold(
      //--- Language Button ---
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.language),
            iconSize: 26,
          ),
        ],
      ),
      //--- Navigation Bar ---
      body: BottomNavBar(),
    );
  }
}
