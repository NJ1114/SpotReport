// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spotreport/model/app_state.dart';
import 'package:spotreport/model/report_model.dart';
import 'package:spotreport/spotreport.dart';
import 'package:provider/provider.dart';

void main() {
  //--- Widget tests ---
  testWidgets(
    'Report Screen',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => AppState(),
            child: SpotReport(),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.location_on);
      final titleFinder = find.text("Report Damage");
      final buttonFinder = find.text("Submit Report");

      expect(iconFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Report History Screen',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => AppState(),
            child: SpotReport(),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.language);
      final titleFinder = find.text("Report History");

      expect(iconFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    },
  );

  //--- Unit Tests ---
  test('Report details are stored', () {
    final report = Report(
        damage: DamageType.sign, location: "Epping", info: "Car crashed into");

    expect(report.damage.label, "Sign");
    expect(report.location, "Epping");
    expect(report.info, "Car crashed into");
  });

  test('Multiple reports are stored', () {
    final report1 = Report(
        damage: DamageType.sign, location: "Epping", info: "Car crashed into");
    final report2 = Report(
        damage: DamageType.potholes,
        location: "Victoria Road, Gladesville",
        info: "Huge pothole on main road");
    final report3 = Report(
        damage: DamageType.fence,
        location: "Chatswood",
        info: "Car crashed into fence");

    final state = AppState();

    state.add(report1);
    state.add(report2);
    state.add(report3);

    expect(state.submissions.length, 3);
  });
}
