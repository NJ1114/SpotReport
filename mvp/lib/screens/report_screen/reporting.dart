import 'package:flutter/material.dart';
import 'package:mvp/model/app_state.dart';
import 'package:mvp/model/report_model.dart';
import 'package:mvp/screens/report_screen/report_history.dart';
import 'package:provider/provider.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key});
  // final void Function(Report newReport) addReport;

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
  void dispose() {
    _locationController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  //--- Handle saving report ---
  void saveReport() {
    //-- Error checking --
    if (_locationController.text.trim().isEmpty ||
        _commentController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text("Invalid Submission"),
          content: Text("Please fill all sections of the report"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
      return;
    } else {
      final report = Report(
        damage: _chosenType,
        location: _locationController.text,
        info: _commentController.text,
      );
      Provider.of<AppState>(context, listen: false).add(report);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ReportHistory(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            Spacer(
                // flex: 2,
                ),

            //-- Damage type --
            Text(
              "Type of Damage",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
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

            Spacer(
                // flex: 2,
                ),

            //-- Location --
            Text(
              "Damage Location",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
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

            Spacer(
                // flex: 2,
                ),

            //-- Photo --
            Text(
              "Provide a photo of the damage",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF3B98C6),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
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

            Spacer(),

            //-- Additional info --
            Text(
              "Additional information or comments",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
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

            Spacer(
              flex: 4,
            ),

            //-- Submission button --
            Center(
              child: FilledButton(
                onPressed: saveReport,
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
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
