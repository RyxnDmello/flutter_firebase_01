import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/icon_model.dart';

class CollectionFormIcon extends StatelessWidget {
  const CollectionFormIcon({
    required this.validateIcon,
    required this.saveIcon,
    super.key,
  });

  final String? Function(String name) validateIcon;
  final void Function(String name) saveIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) => validateIcon(value!),
      onSaved: (newValue) => saveIcon(newValue!),
      onChanged: (value) => saveIcon(value!),
      value: icons[0].name,
      icon: const Icon(
        Icons.menu_rounded,
        color: Colors.black,
      ),
      iconSize: 30,
      isExpanded: false,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 25, 15, 15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
      ),
      items: icons.map((icon) {
        return DropdownMenuItem(
          value: icon.name,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon.icon,
                size: 26.5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                icon.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 22,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
