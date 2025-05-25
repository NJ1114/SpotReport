import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';

class IndividualReport extends StatelessWidget {
  const IndividualReport({super.key, required this.eachReport, required this.reportTitle});

  final Report eachReport;
  final String reportTitle;

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
              reportTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Date Reported: ${eachReport.reportDate}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Damage Type: ${eachReport.damage.label}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Location: ${eachReport.location}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
