import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:SpotReport/model/report_model.dart';

class AppState extends ChangeNotifier {
  //--- All reports submitted ---
  List<Report> _mySubmissions = [];

  //--- Unmodifiable list view of user's submissions ---
  UnmodifiableListView<Report> get submissions =>
      UnmodifiableListView(_mySubmissions);

  //--- Add report to full list ---
  void add(Report report) {
    _mySubmissions.add(report);
    notifyListeners();
  }

  //--- Get user reports from Firebase Database ---
  Future<void> getReport() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final reportInfoSnapshot = await FirebaseFirestore.instance
            .collection("Reports")
            .where("userid", isEqualTo: user.uid)
            .orderBy("date", descending: true)
            .get();

        _mySubmissions = reportInfoSnapshot.docs.map((rep) {
          return Report(
              damage: DamageType.values.firstWhere((e) => e.label == rep["damage"]),
              location: rep["location"],
              info: rep["info"]);
        }).toList();

        notifyListeners();
      } catch (e) {
        print("Unable to get reports: $e");
        return;
      }
    }
    return;
  }
}
