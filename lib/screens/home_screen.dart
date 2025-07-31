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
    );
  }
}
