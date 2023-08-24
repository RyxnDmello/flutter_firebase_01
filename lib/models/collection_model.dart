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
  final IconData icon;
  final String image;
  final List<TaskModel> progress;
  final List<TaskModel> completed;
}

const collections = [
  CollectionModel(
    name: "PROJECTS",
    icon: Icons.work_outline_outlined,
    image: "./lib/images/collection/high.png",
    progress: [
      TaskModel(
        title: "Develop TaskTonic",
        description: "Fix various bugs and issues.",
        priority: Priority.high,
        date: "25 August, 2023",
      ),
      TaskModel(
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
    icon: Icons.work_outline_outlined,
    image: "./lib/images/collection/medium.png",
    progress: [
      TaskModel(
        title: "Develop TaskTonic",
        description: "Fix various bugs and issues.",
        priority: Priority.medium,
        date: "25 August, 2023",
      ),
      TaskModel(
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
    icon: Icons.work_outline_outlined,
    image: "./lib/images/collection/low.png",
    progress: [],
    completed: [],
  ),
];
