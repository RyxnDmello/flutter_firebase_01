import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormPriority extends StatefulWidget {
  const ProgressFormPriority({super.key});

  @override
  State<ProgressFormPriority> createState() {
    return _ProgressFormPriorityState();
  }
}

class _ProgressFormPriorityState extends State<ProgressFormPriority> {
  int _selectedPriority = -1;

  void _selectPriority(int index) {
    setState(() => _selectedPriority = index);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> priority = {
      "HIGH": "./lib/images/progress/high.png",
      "MEDIUM": "./lib/images/progress/medium.png",
      "LOW": "./lib/images/progress/low.png",
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
          itemCount: priority.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _selectPriority(index),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 5),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Image.asset(
                      width: double.infinity,
                      priority.values.elementAt(index),
                      fit: BoxFit.cover,
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
                      Icons.star,
                      size: 30,
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
        ),
      ],
    );
  }
}
