import 'package:flutter/material.dart';

class CollectionsHeaderNavbar extends StatelessWidget {
  const CollectionsHeaderNavbar({
    required this.onOpenForm,
    required this.onRefresh,
    required this.onBack,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final void Function() onOpenForm;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          splashColor: Colors.white,
          iconSize: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async => await onRefresh(),
              icon: const Icon(
                Icons.refresh_sharp,
              ),
              color: Colors.white,
              splashColor: Colors.white,
              iconSize: 30,
            ),
            IconButton(
              onPressed: onOpenForm,
              icon: const Icon(
                Icons.create_outlined,
              ),
              color: Colors.white,
              splashColor: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
      ],
    );
  }
}
