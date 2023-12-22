import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<DateTime?> openDatePicker({
  required BuildContext context,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 2),
    initialDatePickerMode: DatePickerMode.day,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    cancelText: "CANCEL",
    confirmText: "SELECT",
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: colorScheme(),
          datePickerTheme: DatePickerThemeData(
            headerHeadlineStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.65,
              fontSize: 40,
            ),
            dayStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 16,
            ),
            weekdayStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              fontSize: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            yearStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 16,
            ),
            headerBackgroundColor: const Color.fromARGB(255, 0, 0, 25),
            todayBorder: const BorderSide(width: 2.5),
            confirmButtonStyle: const ButtonStyle(),
            cancelButtonStyle: const ButtonStyle(),
            headerForegroundColor: Colors.white,
            dividerColor: Colors.transparent,
          ),
        ),
        child: child!,
      );
    },
  );
}

ColorScheme colorScheme() {
  return const ColorScheme.light(
    onSurface: Color.fromARGB(255, 0, 0, 60),
    primary: Color.fromARGB(255, 0, 0, 60),
  );
}

ButtonStyle buttonStyles() {
  return TextButton.styleFrom(
    foregroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  );
}
