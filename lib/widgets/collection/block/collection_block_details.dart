import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';

class CollectionBlockDetails extends StatelessWidget {
  const CollectionBlockDetails({
    required this.progress,
    required this.completed,
    super.key,
  });

  final List<TaskModel> progress;
  final List<TaskModel> completed;

  @override
  Widget build(BuildContext context) {
    int getPercentage() {
      int totalProgress = progress.length;
      int totalCompleted = completed.length;
      int total = totalProgress + totalCompleted;
      return (totalCompleted * 100) ~/ total;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          progress.isNotEmpty ? "${progress.length} Tasks" : "Add Tasks",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
        Text(
          progress.isNotEmpty ? "${getPercentage()}% Done" : "Empty Collection",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
