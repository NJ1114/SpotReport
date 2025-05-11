import 'package:flutter/material.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportingScreen();
  }
}

class _ReportingScreen extends State<ReportingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Report Damage",
          style: TextStyle(
            color: Color(0xFF327da8),
          ),
        ),
      ],
    );
  }
}
