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
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.red,
          letterSpacing: 0.65,
          fontSize: 12.5,
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
