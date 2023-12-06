import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsFormIcons extends StatelessWidget {
  const CollectionsFormIcons({
    required this.selectedIndex,
    required this.saveIcon,
    required this.title,
    super.key,
  });

  final void Function({
    required IconData icon,
    required int index,
  }) saveIcon;

  final int selectedIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    const List<IconData> icons = [
      Icons.favorite,
      Icons.home,
      Icons.sports_basketball,
      Icons.games,
      Icons.work,
      Icons.people_alt,
      Icons.graphic_eq,
      Icons.restaurant_menu,
      Icons.fastfood_sharp,
      Icons.map,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.65,
            fontSize: 35,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: icons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1,
            crossAxisCount: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => saveIcon(
                icon: icons[index],
                index: index,
              ),
              child: Icon(
                icons[index],
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 0, 0, 200)
                    : Colors.black,
                size: 40,
              ),
            );
          },
        ),
      ],
    );
  }
}
