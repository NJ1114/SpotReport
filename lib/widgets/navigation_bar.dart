import 'package:flutter/material.dart';
import 'package:spotreport/screens/home_screen.dart';
import 'package:spotreport/screens/report_screen/report_history.dart';
import 'package:spotreport/screens/report_screen/reporting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBar();
  }
}

class _BottomNavBar extends State<BottomNavBar> {

  // For report submission screen switch
  void goToHistoryScreen() {
    setState(() {
      currentPageIndex = 2;
    });
  }

  int currentPageIndex = 0; // Starting page index - Home

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      ReportingScreen(
        onSubmission: goToHistoryScreen,
      ),
      ReportHistory(),
    ];

    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        //--- Style ---
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        indicatorColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
        shadowColor: Theme.of(context).colorScheme.surfaceContainerHighest,

        //--- Functions ---
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
          //-- Report --
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Report',
          ),
          //-- Report History --
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Report History',
          ),
        ],
      ),
    );
  }
}
