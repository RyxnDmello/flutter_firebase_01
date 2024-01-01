import 'package:flutter/material.dart';

void showLoadingIndicator({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 0, 0, 255),
          backgroundColor: Colors.black45,
          strokeCap: StrokeCap.round,
        ),
      );
    },
  );
}
