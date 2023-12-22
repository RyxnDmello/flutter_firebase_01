import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';

import './priority/progress_form_priority_type.dart';
import './priority/progress_form_priority_duration.dart';

class ProgressFormPriority extends StatelessWidget {
  const ProgressFormPriority({
    required this.onSavePriority,
    required this.selected,
    required this.title,
    super.key,
  });

  final void Function({
    required int index,
  }) onSavePriority;

  final int selected;
  final String title;

  @override
  Widget build(BuildContext context) {
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
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: priorities.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onSavePriority(
                index: index,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: priorities.values.elementAt(index),
                  borderRadius: BorderRadius.circular(2.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProgressFormPriorityType(
                      type: priorities.keys.elementAt(index),
                      isSelected: selected == index,
                    ),
                    ProgressFormPriorityDuration(
                      duration: durations[index],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ],
    );
  }
}
