import 'package:flutter/material.dart';
import 'package:spotreport/model/report_model.dart';

class RecentReports extends StatelessWidget {
  const RecentReports(
      {super.key, required this.eachReport, required this.reportTitle});

  final Report eachReport;
  final String reportTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Reports",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            //- Report Info -
            Text(
              reportTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Date Reported: ${formatter.format(eachReport.reportDate)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Status: ",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
