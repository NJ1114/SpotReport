import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';
import 'package:mvp/widgets/indivi_report.dart';

class ReportList extends StatelessWidget {
  const ReportList({super.key, required this.allReports});

  final List<Report> allReports;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (listContext, index) => IndividualReport(
        eachReport: allReports[index],
      ),
    );
  }
}
