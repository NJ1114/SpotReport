import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';

class IndividualReport extends StatelessWidget {
  const IndividualReport({super.key, required this.eachReport});

  final Report eachReport;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              'Location: ${eachReport.location}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
