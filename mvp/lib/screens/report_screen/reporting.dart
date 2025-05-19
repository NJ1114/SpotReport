import 'package:flutter/material.dart';
import 'package:mvp/model/report_model.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportingScreen();
  }
}

class _ReportingScreen extends State<ReportingScreen> {
  //--- Controllers ---
  DamageType _chosenType = DamageType.potholes;
  final _locationController = TextEditingController();
  final _commentController = TextEditingController();

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
      //--- Reporting Main ---
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

            SizedBox(
              height: 20,
            ),

            //-- Damage type --
            Text(
              "Type of Damage",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            DropdownButtonFormField(
              items: DamageType.values
                  .map((damage) => DropdownMenuItem(
                      value: damage, child: Text(damage.label)))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(
                  () {
                    _chosenType = value;
                  },
                );
              },
              decoration: InputDecoration(
                label: Text('Select'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3B98C6),
                  ),
                ),
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
              controller: _locationController,
              decoration: InputDecoration(
                label: Text('Enter Location'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3B98C6),
                  ),
                ),
                prefixIcon: Icon(Icons.location_on),
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
              child: Text(
                "Add a photo",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            //-- Additional info --
            Text(
              "Additional information or comments",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF3B98C6),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 60,
            ),

            //-- Submission button --
            Center(
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF3B98C6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                ),
                child: Text(
                  'Submit Report',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
