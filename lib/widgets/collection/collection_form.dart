import 'package:flutter/material.dart';

import '../../models/icon_model.dart';

import './form/collection_form_input.dart';
import './form/collection_form_icon.dart';

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

  void _saveIcon(String name) {
    for (var i = 0; i < icons.length; i++) {
      if (icons[i].name != name) continue;
      setState(() => _icon = icons[i].icon);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CollectionFormInput(
              label: "Name",
            ),
            const SizedBox(
              height: 10,
            ),
            CollectionFormIcon(
              saveIcon: _saveIcon,
            ),
          ],
        ),
      ),
    );
  }
}
