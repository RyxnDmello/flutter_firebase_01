import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionFormPriority extends StatefulWidget {
  const CollectionFormPriority({
    required this.saveImage,
    super.key,
  });

  final void Function(String image) saveImage;

  @override
  State<CollectionFormPriority> createState() {
    return _CollectionFormPriorityState();
  }
}

class _CollectionFormPriorityState extends State<CollectionFormPriority> {
  int _selectedPriority = -1;

  void _selectPriority({required int index}) {
    setState(() => _selectedPriority = index);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> priority = {
      "HIGH": "./lib/images/collection/high.png",
      "MEDIUM": "./lib/images/collection/medium.png",
      "LOW": "./lib/images/collection/low.png",
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select Priority",
          style: GoogleFonts.abel(
            color: const Color.fromARGB(255, 0, 0, 65),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.65,
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
              onTap: () {
                widget.saveImage(priority.values.elementAt(index));
                _selectPriority(index: index);
              },
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
                      size: 30,
                      Icons.star,
                      color: _selectedPriority != index
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
        )
      ],
    );
  }
}
