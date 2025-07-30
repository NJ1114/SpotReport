import 'package:flutter/material.dart';
import 'package:SpotReport/model/app_state.dart';
import 'package:SpotReport/widgets/report_list.dart';
import 'package:provider/provider.dart';

class ReportHistory extends StatefulWidget {
  const ReportHistory({super.key});

  @override
  State<ReportHistory> createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {
  @override
  void initState() {
    gettingReports();
    super.initState();
  }

  Future<void> gettingReports() async {
    await Provider.of<AppState>(context, listen: false).getReport();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return Scaffold(
          //--- Report History Main ---
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Report History',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Expanded(
                child: ReportList(allReports: state.submissions),
              ),
            ],
          ),
        );
      },
    );
  }
}
