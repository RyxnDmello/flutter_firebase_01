import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './task_model.dart';

const _uuid = Uuid();

class CollectionModel {
  CollectionModel({
    required this.name,
    required this.icon,
    required this.image,
    required this.progress,
    required this.completed,
  }) : id = _uuid.v4();

  void setID(String id) {
    this.id = id;
  }

  String id;
  final String name;
  final String image;
  final IconData icon;
  final List<TaskModel> progress;
  final List<TaskModel> completed;
}
