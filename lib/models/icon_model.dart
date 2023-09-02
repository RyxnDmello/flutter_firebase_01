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
    name: "Icon",
    icon: Icons.arrow_forward_ios_rounded,
  ),
  IconModel(
    name: "Personal",
    icon: Icons.favorite_outlined,
  ),
  IconModel(
    name: "Home",
    icon: Icons.home,
  ),
  IconModel(
    name: "Work",
    icon: Icons.work,
  ),
  IconModel(
    name: "Food",
    icon: Icons.restaurant_outlined,
  ),
  IconModel(
    name: "Travel",
    icon: Icons.flight_takeoff_sharp,
  ),
  IconModel(
    name: "Finance",
    icon: Icons.currency_rupee_outlined,
  ),
  IconModel(
    name: "Leisure",
    icon: Icons.beach_access_sharp,
  ),
  IconModel(
    name: "Code",
    icon: Icons.code,
  ),
];
