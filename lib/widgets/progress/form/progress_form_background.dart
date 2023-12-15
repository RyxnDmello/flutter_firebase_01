import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task_model.dart';

class ProgressFormBackground extends StatelessWidget {
  const ProgressFormBackground({
    required this.onSaveBackground,
    required this.selectedIndex,
    required this.title,
    super.key,
  });

  final int selectedIndex;
  final String title;

  final void Function({
    required int index,
  }) onSaveBackground;

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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: taskBackgrounds.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onSaveBackground(
                index: index,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      taskBackgrounds.keys.elementAt(index),
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 6.5),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: Icon(
                  Icons.check,
                  color: selectedIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  size: 50,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
