import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginWidget();
  }
}

class _LoginWidget extends State<LoginWidget> {
  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //--- Email Input ---
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Enter your email"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        //--- Password Input ---
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Enter your password"),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
