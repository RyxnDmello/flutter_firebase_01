import 'package:flutter/material.dart';

class CollectionModel {
  CollectionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.icon,
    required this.image,
  });

  final String id;
  final String name;
  final String date;
  final String image;
  final IconData icon;
}
