import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsFormPriority extends StatelessWidget {
  const CollectionsFormPriority({
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
      "HIGH": "./lib/images/collection/priority/high.png",
      "MEDIUM": "./lib/images/collection/priority/medium.png",
      "LOW": "./lib/images/collection/priority/low.png",
    };

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
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: priority.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => saveImage(
                image: priority.values.elementAt(index),
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
                      letterSpacing: 2.5,
                      fontSize: 40,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Icon(
                      size: 35,
                      Icons.image,
                      color: selectedColor(index),
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
        )
      ],
    );
  }
}
