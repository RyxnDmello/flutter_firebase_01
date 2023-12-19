import 'package:flutter/material.dart';

import '../../database/collection_manager.dart';

import './form/collections_form_title.dart';
import './form/collections_form_input.dart';
import './form/collections_form_icons.dart';
import './form/collections_form_priority.dart';
import './form/collections_form_button.dart';

class CollectionsForm extends StatefulWidget {
  const CollectionsForm({
    required this.updateCollections,
    super.key,
  });

  final Future<void> Function() updateCollections;

  @override
  State<CollectionsForm> createState() {
    return _CollectionsFormState();
  }
}

class _CollectionsFormState extends State<CollectionsForm> {
  final _formKey = GlobalKey<FormState>();
  int _selectedPriorityIndex = -1;
  int _selectedIconIndex = -1;
  String? _name;
  IconData? _icon;
  String? _image;

  Future<void> _saveForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_image == null || _icon == null) return;

    _formKey.currentState!.save();

    await collectionManager.createCollection(
      icon: _icon!,
      image: _image!,
      name: _name!,
    );

    await widget.updateCollections();

    _closeForm();
  }

  String? _validateName(String name) {
    if (name.isEmpty ||
        name.split(' ').length > 2 ||
        name.length < 2 ||
        name.length > 15) {
      return "INVALID COLLECTION NAME";
    }

    return null;
  }

  void _saveName(String name) {
    _name = name.toUpperCase();
  }

  void _saveIcon({required IconData icon, required int index}) {
    setState(() => _selectedIconIndex = index);
    _icon = icon;
  }

  void _savePriority({required String image, required int index}) {
    setState(() => _selectedPriorityIndex = index);
    _image = image;
  }

  void _closeForm() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            const CollectionsFormTitle(
              title: "Create Collection",
            ),
            const SizedBox(
              height: 15,
            ),
            CollectionsFormInput(
              validateInput: _validateName,
              saveInput: _saveName,
              label: "Name",
            ),
            const SizedBox(
              height: 20,
            ),
            CollectionsFormIcons(
              selectedIndex: _selectedIconIndex,
              title: "Select Icon",
              saveIcon: _saveIcon,
            ),
            const SizedBox(
              height: 15,
            ),
            CollectionsFormPriority(
              selectedIndex: _selectedPriorityIndex,
              saveImage: _savePriority,
              title: "Select Priority",
            ),
            const SizedBox(
              height: 25,
            ),
            CollectionsFormButton(
              label: "Create Collection",
              saveForm: _saveForm,
            ),
          ],
        ),
      ),
    );
  }
}
