import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mvp/model/report_model.dart';

class AppState extends ChangeNotifier {
  //All reports submitted
  final List<Report> _mySubmissions = [];

  //-- Unmodifiable list view of user's submissions
  UnmodifiableListView<Report> get submissions => UnmodifiableListView(_mySubmissions);

  //-- Add report to full list --
  void add(Report report) {
    _mySubmissions.add(report);
    notifyListeners();
  }
}
