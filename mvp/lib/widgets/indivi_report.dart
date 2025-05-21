import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';

class IndividualReport extends StatelessWidget {
  const IndividualReport({super.key, required this.eachReport});

  final Report eachReport;

  // int reportNums() {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Damage Report 1', //Change report number function or method
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Date Reported: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Damage Type: ${eachReport.damage.label}',
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
