import 'package:flutter/material.dart';

class ProgressTaskImage extends StatelessWidget {
  const ProgressTaskImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: Opacity(
        opacity: 0.85,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
