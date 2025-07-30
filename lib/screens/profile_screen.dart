import 'package:flutter/material.dart';
import 'package:spotreport/widgets/login_register_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Column(
        children: [
          Center(
            child: LogoutWidget(),
          ),
        ],
      ),
    );
  }
}
