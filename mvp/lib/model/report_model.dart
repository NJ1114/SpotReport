import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

// enum Type {potholes, Damaged Playground, Fallen Tree, Broken Fence, Graffiti, Damaged Sign}

class Report {
  final String id;
  final String damage; //change data type later
  final String location;
  //add photo later
  final String info;

  Report({
    required this.damage,
    required this.location,
    required this.info,
  }) : id = uuid.v4();
}
