import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormDateCustom extends StatelessWidget {
  const ProgressFormDateCustom({
    required this.onSaveDate,
    required this.isSelected,
    required this.date,
    super.key,
  });

  final Future<void> Function() onSaveDate;
  final bool isSelected;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSaveDate,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: const Color.fromARGB(255, 0, 0, 180),
                  width: 2.5,
                )
              : null,
          color: Color.fromARGB(isSelected ? 40 : 30, 0, 0, 255),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timelapse,
                  color: Colors.black,
                  size: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  date,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 22.5,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.menu_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
