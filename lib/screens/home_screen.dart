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
  Future<void> getRecentReports() async {
    final allReports =
        await Provider.of<AppState>(context, listen: false).getReport();
    // final recentReports = allReports.length > 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--- Report History Main ---
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
              vertical: 30,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
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
                      //- Reports -
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
