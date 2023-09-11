import 'package:flutter/material.dart';

class ProgressTaskImage extends StatelessWidget {
  const ProgressTaskImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.85,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
