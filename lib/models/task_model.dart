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
  "CRITICAL": Colors.black,
  "HIGH": Color.fromARGB(255, 200, 0, 0),
  "MEDIUM": Color.fromARGB(255, 0, 0, 200),
  "LOW": Color.fromARGB(255, 0, 200, 0),
};

const List<List<Color>> taskBackgrounds = [
  [
    Color(0XFF00ff87),
    Color(0xFF00FF87),
  ],
  [
    Color(0XFF0061ff),
    Color(0xFF60efff),
  ],
  [
    Color(0XFF40C9FF),
    Color(0xFFE81CFF),
  ],
  [
    Color(0XFF84FFC9),
    Color(0xFFAAB2FF),
    Color(0xFFECA0FF),
  ],
  [
    Color(0XFFF9C58D),
    Color(0xFFF492F0),
  ],
  [
    Color(0XFF8DE9D5),
    Color(0xFF32C4C0),
  ],
  [
    Color(0XFFEA98DA),
    Color(0xFF5B6CF9),
  ],
  [
    Color(0XFFF292ED),
    Color(0xFFF36364),
  ],
];
