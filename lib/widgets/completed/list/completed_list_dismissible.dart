import 'package:flutter/material.dart';

class CompletedListDismissible extends StatelessWidget {
  const CompletedListDismissible({
    required this.alignment,
    required this.color,
    required this.icon,
    super.key,
  });

  final Alignment alignment;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
