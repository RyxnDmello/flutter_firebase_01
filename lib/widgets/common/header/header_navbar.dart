import 'package:flutter/material.dart';

class HeaderNavbar extends StatelessWidget {
  const HeaderNavbar({
    required this.onOpenForm,
    required this.onClose,
    super.key,
  });

  final void Function()? onOpenForm;
  final void Function() onClose;

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
        if (onOpenForm != null)
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
