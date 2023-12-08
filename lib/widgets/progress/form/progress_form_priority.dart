import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormPriority extends StatelessWidget {
  const ProgressFormPriority({
    required this.selectedIndex,
    required this.saveImage,
    required this.title,
    super.key,
  });

  final void Function({
    required String image,
    required int index,
  }) saveImage;

  final int selectedIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> priority = {
      "HIGH": "./lib/images/progress/priority/high.png",
      "MEDIUM": "./lib/images/progress/priority/medium.png",
      "LOW": "./lib/images/progress/priority/low.png",
    };

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
            fontSize: 40,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: priority.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => saveImage(
                image: priority.entries.elementAt(index).value,
                index: index,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 110,
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          priority.values.elementAt(index),
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(
                    priority.keys.elementAt(index),
                    style: GoogleFonts.abel(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.65,
                      fontSize: 40,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(
                      Icons.favorite_border,
                      size: 35,
                      color: selectedIndex != index
                          ? Colors.transparent
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ],
    );
  }
}
