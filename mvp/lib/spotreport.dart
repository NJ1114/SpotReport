import 'package:flutter/material.dart';
import 'package:mvp/widgets/login_register_widget.dart';
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
        //-- App Logo ---
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Sp",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "o",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "tReport",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
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
