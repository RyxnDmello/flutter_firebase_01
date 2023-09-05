import 'package:flutter/material.dart';

class _IconModel {
  const _IconModel({
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
  _IconModel(
    name: "Icon",
    icon: Icons.arrow_forward_ios_rounded,
  ),
  _IconModel(
    name: "Personal",
    icon: Icons.favorite_outlined,
  ),
  _IconModel(
    name: "Home",
    icon: Icons.home,
  ),
  _IconModel(
    name: "Work",
    icon: Icons.work,
  ),
  _IconModel(
    name: "Food",
    icon: Icons.restaurant_outlined,
  ),
  _IconModel(
    name: "Travel",
    icon: Icons.flight_takeoff_sharp,
  ),
  _IconModel(
    name: "Finance",
    icon: Icons.currency_rupee_outlined,
  ),
  _IconModel(
    name: "Leisure",
    icon: Icons.beach_access_sharp,
  ),
  _IconModel(
    name: "Code",
    icon: Icons.code,
  ),
];
