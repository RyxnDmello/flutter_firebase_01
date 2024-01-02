import 'package:flutter/material.dart';

class BarController extends StatelessWidget {
  const BarController({
    required this.onTapRight,
    required this.onTapLeft,
    required this.totalTabs,
    required this.tabIndex,
    required this.vsync,
    super.key,
  });

  final void Function() onTapRight;
  final void Function() onTapLeft;
  final TickerProvider vsync;
  final int totalTabs;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              onTap: onTapLeft,
              icon: Icons.keyboard_arrow_left,
            ),
            ControllerButton(
              onTap: onTapRight,
              icon: Icons.keyboard_arrow_right,
            ),
          ],
        ),
        TabPageSelector(
          selectedColor: const Color.fromARGB(255, 0, 0, 200),
          controller: TabController(
            initialIndex: tabIndex,
            length: totalTabs,
            vsync: vsync,
          ),
        ),
      ],
    );
  }
}

class ControllerButton extends StatelessWidget {
  const ControllerButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final void Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      color: const Color.fromARGB(255, 0, 0, 50),
      iconSize: 35,
    );
  }
}
