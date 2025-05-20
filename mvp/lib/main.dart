import 'package:flutter/material.dart';
import 'package:mvp/model/app_state.dart';
import 'package:mvp/spotreport.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const SpotReport(),
    ),
  );
}
