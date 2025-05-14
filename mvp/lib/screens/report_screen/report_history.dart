import 'package:flutter/material.dart';

class ReportHistory extends StatefulWidget {
  const ReportHistory({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportHistory();
  }
}

class _ReportHistory extends State<ReportHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--- Language button ---
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.language),
            iconSize: 26,
          ),
        ],
      ),
      //--- Report History Main ---
      body: Text("Report History page"),

      //--- Navigation Bar ---
      //-- Reporting --
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3B98C6),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          //-- Home --
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          //-- Report History --
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Report History',
          ),
        ],
        indicatorColor: const Color(0xFF3B98C6),
      ),
    );
  }
}
