import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionFormButton extends StatelessWidget {
  const CollectionFormButton({
    required this.saveForm,
    super.key,
  });

  final void Function() saveForm;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => saveForm(),
      child: Text(
        "Create Collection",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
