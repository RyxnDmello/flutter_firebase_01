import 'package:flutter/material.dart';

import './task_model.dart';

class CollectionModel {
  const CollectionModel({
    required this.name,
    required this.icon,
    required this.image,
    required this.progress,
    required this.completed,
  });

  final String name;
  final String image;
  final IconData icon;
  final List<TaskModel> progress;
  final List<TaskModel> completed;
}
