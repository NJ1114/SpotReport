import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--- Report History Main ---
      body: Center(
        child: Text(
          "Home Screen Placeholder",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
