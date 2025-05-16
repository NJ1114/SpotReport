import 'package:flutter/material.dart';
import 'package:mvp/screens/home_screen.dart';
import 'package:mvp/screens/report_screen/report_history.dart';
import 'package:mvp/screens/report_screen/reporting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBar();
  }
}

class _BottomNavBar extends State<BottomNavBar> {
  final List<Widget> screens = [
    HomeScreen(),
    ReportHistory(),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      //-- Reporting --
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF3B98C6),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
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
