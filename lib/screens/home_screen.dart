import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotreport/model/app_state.dart';
import 'package:spotreport/widgets/report_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    getRecentReports();
    super.initState();
  }

  Future<void> getRecentReports() async {
    await Provider.of<AppState>(context, listen: false).getReport();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      final recents = state.submissions.take(2).toList(); // Only get 2 reports

      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Title --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Dashboard",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            //-- Recent Report History --
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 25,
              ),
              child: SizedBox(
                height: 320,
                child: recents.isNotEmpty
                    ? RecentReportList(allReports: recents)
                    :
                    //- Condition - no reports -
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 30,
                            ),
                            child: Text(
                              "No recent reports.",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
