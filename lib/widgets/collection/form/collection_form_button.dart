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
    return ElevatedButton.icon(
      onPressed: () => saveForm(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 80),
        minimumSize: const Size(double.infinity, 50),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      icon: const Icon(
        Icons.create_new_folder_outlined,
        color: Colors.white,
        size: 30,
      ),
      label: Text(
        "Create Collection",
        style: GoogleFonts.poppins(
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 22.5,
        ),
      ),
    );
  }
}
