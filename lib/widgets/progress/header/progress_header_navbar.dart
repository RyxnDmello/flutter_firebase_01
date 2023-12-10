import 'package:flutter/material.dart';

class ProgressHeaderNavbar extends StatelessWidget {
  const ProgressHeaderNavbar({
    required this.onOpenForm,
    super.key,
  });

  final void Function() onOpenForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
          splashColor: Colors.white,
          color: Colors.white,
          iconSize: 30,
        ),
        IconButton(
          onPressed: onOpenForm,
          icon: const Icon(
            Icons.create_outlined,
          ),
          splashColor: Colors.white,
          color: Colors.white,
          iconSize: 30,
        ),
      ],
    );
  }
}
