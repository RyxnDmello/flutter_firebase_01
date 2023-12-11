import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderController extends StatelessWidget {
  const HeaderController({
    required this.onOpenScreen,
    required this.totalTasks,
    required this.onClear,
    required this.label,
    super.key,
  });

  final Future<void> Function()? onClear;
  final void Function()? onOpenScreen;
  final int? totalTasks;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onOpenScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.abel(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 20,
            ),
          ),
        ),
        if (onClear == null)
          Text(
            "$totalTasks Active",
            style: GoogleFonts.abel(
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 25,
            ),
          ),
        if (onClear != null)
          IconButton(
            onPressed: () async => await onClear!(),
            iconSize: 30,
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
