import 'package:flutter/material.dart';
import 'package:spotreport/screens/settings_screens/settings_screen.dart';
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

  Future<void> languagePopUp() async {
    showDialog(
      context: context,
      builder: (popcontext) {
        return SimpleDialog(
          title: Text(
            "Select Language",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {},
              child: Text(
                "English",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text(
                "French",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: Text(
                "Spanish",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(popcontext);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      //--- Language Button ---
      appBar: AppBar(
        leading: IconButton(
          onPressed: languagePopUp,
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
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: Icon(Icons.settings),
            iconSize: 26,
          ),
        ],
      ),
      //--- Navigation Bar ---
      body: BottomNavBar(),
    );
  }
}
