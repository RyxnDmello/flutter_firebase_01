import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';

class ProgressFormPriority extends StatelessWidget {
  const ProgressFormPriority({
    required this.onSavePriority,
    required this.selectedIndex,
    required this.title,
    super.key,
  });

  final int selectedIndex;
  final String title;

  final void Function({
    required int index,
  }) onSavePriority;

  @override
  Widget build(BuildContext context) {
    Color selectedColor(int index) {
      if (selectedIndex != index) return Colors.transparent;
      return Colors.white;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5,
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 0.65,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: taskPriorities.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onSavePriority(index: index),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 6.5),
                          blurRadius: 5,
                        ),
                      ],
                      color: taskPriorities.values.elementAt(index),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      taskPriorities.keys.elementAt(index),
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.check,
                      color: selectedColor(index),
                      size: 30,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
