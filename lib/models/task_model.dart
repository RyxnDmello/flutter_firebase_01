import 'package:flutter/material.dart';

class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final int priority;
  final String date;
}

const Map<String, Color> priorities = {
  "CRITICAL": Color.fromARGB(255, 0, 0, 0),
  "HIGH": Color.fromARGB(255, 200, 0, 0),
  "MEDIUM": Color.fromARGB(255, 0, 0, 200),
  "LOW": Color.fromARGB(255, 0, 180, 0),
  "SIDE": Color.fromARGB(255, 150, 0, 200),
};

const List<int> durations = [5, 10, 15, 20, 25, 30, 35, 40];
