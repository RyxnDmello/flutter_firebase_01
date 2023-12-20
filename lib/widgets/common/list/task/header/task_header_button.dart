import 'package:flutter/material.dart';

class TaskHeaderButton extends StatelessWidget {
  const TaskHeaderButton({
    required this.onTap,
    required this.icon,
    super.key,
  });

  final Future<void> Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: () async => await onTap!(),
      style: IconButton.styleFrom(
        side: const BorderSide(
          color: Colors.black,
          width: 2.5,
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      color: Colors.black,
      iconSize: 25,
    );
  }
}
