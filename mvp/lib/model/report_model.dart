import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum DamageType {
  potholes('Potholes'),
  playground('Damaged Playground'),
  tree('Fallen Tree'),
  fence('Broken Fence'),
  graffiti('Graffiti'),
  sign('Damaged Sign'),
  other('Other');

  const DamageType(this.label);
  final String label;
}

class Report {
  final String id;
  final Enum damage;
  final String location;
  //add photo later
  final String info;

  Report({
    required this.damage,
    required this.location,
    required this.info,
  }) : id = uuid.v4();
}
