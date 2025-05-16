import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';

class IndividualReport extends StatelessWidget {
  const IndividualReport({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Damage Report 1',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Status: ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Date Reported: ',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'Location; ${report.location}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
