import 'package:flutter/material.dart';

class CollectionBlockImage extends StatelessWidget {
  const CollectionBlockImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
      height: 120,
    );
  }
}
