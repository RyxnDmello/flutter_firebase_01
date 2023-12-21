import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './date/progress_form_date_custom.dart';
import './date/progress_form_date_option.dart';

class ProgressFormDate extends StatelessWidget {
  const ProgressFormDate({
    required this.onSelectDuration,
    required this.onSaveDate,
    required this.savedDate,
    required this.selected,
    required this.title,
    super.key,
  });

  final Future<void> Function() onSaveDate;

  final void Function({
    required int days,
    required int index,
  }) onSelectDuration;

  final String? savedDate;
  final int selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    List<int> days = [5, 10, 15, 20, 25, 30, 35, 40];

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
          onSaveDate: onSaveDate,
          savedDate: savedDate,
        ),
        const SizedBox(
          height: 15,
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
          itemCount: days.length,
          itemBuilder: (context, index) {
            return ProgressFormDateOption(
              onSelectDuration: () => onSelectDuration(
                days: days[index],
                index: index,
              ),
              isSelected: selected == index,
              days: days[index],
            );
          },
        ),
      ],
    );
  }
}
