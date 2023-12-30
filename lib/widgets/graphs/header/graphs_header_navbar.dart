import 'package:flutter/material.dart';

class GraphsHeaderNavbar extends StatelessWidget {
  const GraphsHeaderNavbar({
    required this.onClose,
    super.key,
  });

  final void Function() onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onClose,
          icon: const Icon(
            Icons.arrow_back,
          ),
          iconSize: 30,
          color: Colors.white,
          splashRadius: 25,
        ),
      ],
    );
  }
}
