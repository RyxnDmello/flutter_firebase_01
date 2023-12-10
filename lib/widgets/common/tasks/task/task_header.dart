import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskHeader extends StatelessWidget {
  const TaskHeader({
    required this.onAddTask,
    required this.onDeleteTask,
    required this.date,
    super.key,
  });

  final Future<void> Function()? onDeleteTask;
  final Future<void> Function()? onAddTask;
  final String date;

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
            if (onAddTask != null)
              HeaderButton(
                onTap: () async => await onAddTask!(),
                color: Colors.white,
                icon: Icons.check,
              ),
            if (onDeleteTask != null)
              HeaderButton(
                onTap: () async => await onDeleteTask!(),
                color: Colors.white,
                icon: Icons.close,
              ),
          ],
        ),
        Text(
          date,
          textAlign: TextAlign.right,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.25,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required this.onTap,
    required this.color,
    required this.icon,
    super.key,
  });

  final void Function() onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onTap,
      style: IconButton.styleFrom(
        side: BorderSide(
          color: color,
          width: 2.5,
        ),
      ),
      icon: Icon(icon),
      iconSize: 25,
      color: color,
    );
  }
}
