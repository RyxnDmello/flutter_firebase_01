import 'package:flutter/material.dart';

class IconModel {
  const IconModel({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;

  IconData getIcon() {
    return icon;
  }
}

const icons = [
  IconModel(
    name: "HOME",
    icon: Icons.home,
  ),
  IconModel(
    name: "WORK",
    icon: Icons.work,
  ),
  IconModel(
    name: "CODE",
    icon: Icons.code,
  ),
];
