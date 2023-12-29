import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';

import './date/progress_form_date_custom.dart';
import './date/progress_form_date_option.dart';

class ProgressFormDate extends StatelessWidget {
  const ProgressFormDate({
    required this.onSaveOption,
    required this.selectedOption,
    required this.onSaveDate,
    required this.savedDate,
    required this.title,
    super.key,
  });

  final Future<void> Function() onSaveDate;

  final void Function({
    required int duration,
    required int index,
  }) onSaveOption;

  final int? selectedOption;
  final String? savedDate;
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
        ProgressFormDateCustom(
          isSelected: savedDate != null ? true : false,
          date: savedDate ?? "Custom Date",
          onSaveDate: onSaveDate,
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
          ),
          itemCount: durations.length,
          itemBuilder: (context, index) {
            return ProgressFormDateOption(
              onSelectOption: () => onSaveOption(
                duration: durations[index],
                index: index,
              ),
              isSelected: selectedOption == index,
              duration: durations[index],
            );
          },
        ),
      ],
    );
  }
}
