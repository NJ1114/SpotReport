import 'package:flutter/material.dart';
import 'package:spotreport/model/report_model.dart';
import 'package:spotreport/widgets/indivi_report.dart';

class ReportList extends StatelessWidget {
  const ReportList({super.key, required this.allReports});

  final List<Report> allReports;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allReports.length,
      itemBuilder: (listContext, index) {
        final reportNum = 'Damage Report ${index + 1}';
        return IndividualReport(
          eachReport: allReports[index],
          reportTitle: reportNum,
        );
      },
    );
  }
}
