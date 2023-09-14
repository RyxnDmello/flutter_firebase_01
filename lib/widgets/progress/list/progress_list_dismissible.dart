import 'package:flutter/material.dart';

class ProgressListDismissible extends StatelessWidget {
  const ProgressListDismissible({
    required this.icon,
    required this.color,
    required this.alignment,
    super.key,
  });

  final Alignment alignment;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      alignment: alignment,
      decoration: BoxDecoration(
        color: color.withAlpha(100),
      ),
      child: Icon(
        icon,
        color: color,
        size: 40,
      ),
    );
  }
}
