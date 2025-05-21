import 'package:flutter/material.dart';
import 'package:mvp/model/app_state.dart';
import 'package:mvp/widgets/report_list.dart';
import 'package:provider/provider.dart';

class ReportHistory extends StatelessWidget {
  const ReportHistory({super.key});

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
