import 'package:flutter/material.dart';

import '../../models/icon_model.dart';

import './form/collection_form_title.dart';
import './form/collection_form_input.dart';
import './form/collection_form_icon.dart';
import './form/collection_form_priority.dart';
import './form/collection_form_button.dart';

class CollectionForm extends StatefulWidget {
  const CollectionForm({super.key});

  @override
  State<CollectionForm> createState() {
    return _CollectionFormState();
  }
}

class _CollectionFormState extends State<CollectionForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  IconData? _icon;
  String? _image;

  void _saveForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    // ignore: avoid_print
    print(_name);
    // ignore: avoid_print
    print(_icon);
    // ignore: avoid_print
    print(_image);
  }

  String? _validateName(String name) {
    if (name.isEmpty || name.length < 2) {
      return "INVALID COLLECTION NAME";
    }

    return null;
  }

  String? _validateIcon(String name) {
    for (var i = 0; i < icons.length; i++) {
      if (icons[i].name != name) continue;
      return null;
    }

    return "PLEASE SELECT AN ICON";
  }

  void _saveName(String name) {
    _name = name;
  }

  void _saveIcon(String name) {
    for (var i = 0; i < icons.length; i++) {
      if (icons[i].name != name) continue;
      _icon = icons[i].icon;
      return;
    }
  }

  void _saveImage(String image) {
    _image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CollectionFormTitle(),
            const SizedBox(
              height: 10,
            ),
            CollectionFormInput(
              validateInput: _validateName,
              saveInput: _saveName,
              label: "Name",
            ),
            const SizedBox(
              height: 10,
            ),
            CollectionFormIcon(
              validateIcon: _validateIcon,
              saveIcon: _saveIcon,
            ),
            const SizedBox(
              height: 20,
            ),
            CollectionFormPriority(
              saveImage: _saveImage,
            ),
            const SizedBox(
              height: 20,
            ),
            CollectionFormButton(saveForm: _saveForm),
          ],
        ),
      ),
    );
  }
}
