import 'package:flutter/material.dart';

import './form/progress_form_title.dart';
import './form/progress_form_input.dart';
import './form/progress_form_priority.dart';
import './form/progress_form_button.dart';

class ProgressForm extends StatefulWidget {
  const ProgressForm({super.key});

  @override
  State<ProgressForm> createState() {
    return _ProgressFormState();
  }
}

class _ProgressFormState extends State<ProgressForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Form(
        key: _formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProgressFormTitle(),
            SizedBox(
              height: 10,
            ),
            ProgressFormInput(
              label: "Name",
              maxLines: 1,
            ),
            SizedBox(
              height: 15,
            ),
            ProgressFormInput(
              label: "Description",
              maxLines: 5,
            ),
            SizedBox(
              height: 15,
            ),
            ProgressFormPriority(),
            SizedBox(
              height: 25,
            ),
            ProgressFormButton(),
          ],
        ),
      ),
    );
  }
}
