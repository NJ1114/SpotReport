import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum DamageType {
  potholes('Potholes'),
  playground('Damaged Playground'),
  tree('Fallen Tree'),
  fence('Broken Fence'),
  graffiti('Graffiti'),
  sign('Sign'),
  other('Other');

  const DamageType(this.label);
  final String label;
}

//--- Date Formatter ---
final formatter = DateFormat('dd-MM-yyyy');

class Report {
  final String id;
  final DamageType damage;
  final String location;
  //add photo later
  final String info;
  final DateTime reportDate;

  Report({
    required this.damage,
    required this.location,
    required this.info,
    DateTime? reportDate,
  }) : id = uuid.v4(), reportDate = DateTime.now();
}
