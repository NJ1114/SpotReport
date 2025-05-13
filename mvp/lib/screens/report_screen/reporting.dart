import 'package:flutter/material.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportingScreen();
  }
}

class _ReportingScreen extends State<ReportingScreen> {
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
      //--- Information ---
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Title --
            Text(
              "Report Damage",
              style: TextStyle(
                color: Color(0xFF353B3C),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            //-- Damage type --
            Text(
              "Type of Damage",
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            //-- Location --
            Text(
              "Damage Location",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3B98C6),
                  ),
                ),
              ),
            ),

            //-- Photo --
            Text(
              "Provide a photo of the damage",
              style: TextStyle(fontSize: 18),
            ),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF3B98C6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: Text("Add a photo"),
            ),

            //-- Additional info --
            Text(
              "Additional information or comments",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3B98C6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
