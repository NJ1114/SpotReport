import 'package:flutter/material.dart';
import 'package:spotreport/screens/profile_screen.dart';
import 'package:spotreport/widgets/navigation_bar.dart';

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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.language),
          iconSize: 26,
        ),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            icon: Icon(Icons.person),
            iconSize: 26,
          ),
        ],
      ),
      //--- Navigation Bar ---
      body: BottomNavBar(),
    );
  }
}
