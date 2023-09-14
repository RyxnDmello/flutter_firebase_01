import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/collection_model.dart';

class ProgressAppBar extends StatelessWidget {
  const ProgressAppBar({
    required this.totalProgressTasks,
    required this.totalCompletedTasks,
    required this.collection,
    super.key,
  });

  final CollectionModel collection;
  final int totalProgressTasks;
  final int totalCompletedTasks;

  @override
  Widget build(BuildContext context) {
    double getCompletedPercentage() {
      int total = totalProgressTasks + totalCompletedTasks;
      if (total == 0) return 0;
      return (totalCompletedTasks * 100) / total;
    }

    return Container(
      height: 125,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            collection.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      collection.icon,
                      color: Colors.white,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 6.5,
                    ),
                    Text(
                      collection.name,
                      style: GoogleFonts.abel(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$totalProgressTasks Active",
                      style: GoogleFonts.abel(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "${getCompletedPercentage()}% Completed",
                      style: GoogleFonts.abel(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
