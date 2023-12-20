import 'package:flutter/material.dart';

class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.background,
    required this.priority,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final int background;
  final int priority;
  final String date;
}

const Map<String, Color> taskPriorities = {
  "CRITICAL": Color.fromARGB(255, 0, 0, 0),
  "HIGH": Color.fromARGB(255, 200, 0, 0),
  "MEDIUM": Color.fromARGB(255, 0, 0, 200),
  "LOW": Color.fromARGB(255, 0, 180, 0),
  "SIDE": Color.fromARGB(255, 150, 0, 200),
};

const Map<String, double> taskBackgrounds = {
  "./lib/images/progress/backgrounds/1.png": 0.65,
  "./lib/images/progress/backgrounds/2.png": 0.65,
  "./lib/images/progress/backgrounds/3.png": 0.65,
  "./lib/images/progress/backgrounds/4.png": 0.65,
  "./lib/images/progress/backgrounds/5.png": 0.65,
  "./lib/images/progress/backgrounds/6.png": 0.65,
};
