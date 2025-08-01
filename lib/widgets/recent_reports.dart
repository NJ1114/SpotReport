import 'package:flutter/material.dart';
import 'package:spotreport/model/report_model.dart';

class RecentReports extends StatelessWidget {
  const RecentReports({super.key, required this.allReports});

  final List<Report> allReports;

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
            //-- Recent Report Heading --
            Text(
              "Recent Reports",
              style:
                  Theme.of(context).textTheme.titleMedium!.copyWith(height: 2),
            ),
            //-- Recent Reports Section --
            ...List.generate(
              allReports.length,
              (index) {
                final report = allReports[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //- Report Info -
                    Text(
                      "Report ${index + 1}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            height: 2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Date Reported: ${formatter.format(report.reportDate)}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(height: 2),
                    ),
                    Text(
                      "Status: ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(height: 2),
                    ),
                    if (index != allReports.length - 1)
                      const Divider(
                        height: 40,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
