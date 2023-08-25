import 'package:flutter/material.dart';

import './task_model.dart';
import './icon_model.dart';

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

final collections = [
  CollectionModel(
    name: "PROJECTS",
    image: "./lib/images/collection/high.png",
    icon: icons[0].icon,
    progress: [
      const TaskModel(
        title: "Develop TaskTonic",
        description: "Fix various bugs and issues.",
        priority: Priority.high,
        date: "25 August, 2023",
      ),
      const TaskModel(
        title: "CyberVerse Cart",
        description: "Develop the cart page.",
        priority: Priority.low,
        date: "26 August, 2023",
      ),
    ],
    completed: [],
  ),
  CollectionModel(
    name: "STUDIES",
    image: "./lib/images/collection/medium.png",
    icon: icons[1].icon,
    progress: [
      const TaskModel(
        title: "Develop TaskTonic",
        description: "Fix various bugs and issues.",
        priority: Priority.medium,
        date: "25 August, 2023",
      ),
      const TaskModel(
        title: "CyberVerse Cart",
        description: "Develop the cart page.",
        priority: Priority.high,
        date: "26 August, 2023",
      ),
    ],
    completed: [],
  ),
  CollectionModel(
    name: "WORK",
    image: "./lib/images/collection/low.png",
    icon: icons[2].icon,
    progress: [],
    completed: [],
  ),
];
