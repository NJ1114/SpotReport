import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';
import 'package:mvp/widgets/indivi_report.dart';
import 'package:mvp/widgets/report_list.dart';

class ReportHistory extends StatelessWidget {
  ReportHistory({super.key});

  final List<Report> _mySubmissions = [
    //tester submission
    Report(
        damage: DamageType.sign,
        location: "Epping",
        info: "Car crashed into the sign"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--- Language button ---
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.language),
            iconSize: 26,
          ),
        ],
      ),
      //--- Report History Main ---
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Report History',
              style: TextStyle(
                color: Color(0xFF353B3C),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ReportList(allReports: _mySubmissions),
          ),
        ],
      ),
    );
  }
}
