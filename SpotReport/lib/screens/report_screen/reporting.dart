import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mvp/model/app_state.dart';
import 'package:mvp/model/report_model.dart';
import 'package:mvp/widgets/location_services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ReportingScreen extends StatefulWidget {
  const ReportingScreen({super.key, this.onSubmission});
  final VoidCallback? onSubmission;

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
  XFile? _image;

  @override
  void dispose() {
    _locationController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = selectedImage;
    });
  }

  //--- Handle Saving Report ---
  Future<void> saveReport() async {
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
              child: Text("Close"),
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

      //-- Adding to Report List --
      Provider.of<AppState>(context, listen: false).add(report);

      //-- Save New Report to Firebase ---
      final user =
          FirebaseAuth.instance.currentUser; // Get current logged-in user

      if (user != null) {
        await FirebaseFirestore.instance.collection("Reports").add(
          {
            "userid": user.uid,
            "damage": report.damage.label,
            "location": report.location,
            "info": report.info,
            "date": report.reportDate,
          },
        );
      } else {
        print("Error adding new report");
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text("Not Logged In"),
            content: Text("You must be logged in to submit a report."),
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
      }

      //--- Switch to History Screen ---
      if (widget.onSubmission != null) {
        widget.onSubmission!();
      }
    }
  }

  Future<void> autofillLocation() async {
    final locationServices = LocationServices(); // Location service class

    // Getting the coordinates
    Position? currentCoords = await locationServices.currentLocation();

    // Converting the coordinates to string address
    String? address =
        await locationServices.convertCoordsAddress(currentCoords);

    setState(() {
      _locationController.text = address ?? "Address invalid";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //--- Reporting Main ---
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-- Title --
              Text(
                "Report Damage",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
          
              SizedBox(
                height: 10,
              ),
          
              //-- Damage type --
              Text(
                "Type of Damage",
                style: Theme.of(context).textTheme.titleMedium,
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
                ),
              ),
          
              SizedBox(
                height: 10,
              ),
          
              //-- Location --
              Text(
                "Damage Location",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  label: Text('Enter Location'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: IconButton(
                    onPressed: autofillLocation,
                    icon: Icon(
                      Icons.location_on,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withValues(alpha: 0.75),
                    ),
                  ),
                ),
              ),
          
              SizedBox(
                height: 10,
              ),
          
              //-- Photo --
              Text(
                "Provide a photo of the damage",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: addImage,
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                child: Text(
                  "Add a photo",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
          
              SizedBox(
                height: 10,
              ),
          
              //-- Additional info --
              Text(
                "Additional information or comments",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _commentController,
                minLines: 4, // Makes text box size
                maxLines: 4, // Allows scroll
              ),
          
              SizedBox(
                height: 40,
              ),
          
              //-- Submission button --
              Center(
                child: ElevatedButton(
                  onPressed: saveReport,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  child: Text(
                    'Submit Report',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
