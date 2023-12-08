import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../../models/collection_model.dart';

import './form/progress_form_title.dart';
import './form/progress_form_input.dart';
import './form/progress_form_priority.dart';
import './form/progress_form_button.dart';

class ProgressForm extends StatefulWidget {
  const ProgressForm({
    required this.updateTasks,
    required this.collection,
    super.key,
  });

  final Future<void> Function() updateTasks;
  final CollectionModel collection;

  @override
  State<ProgressForm> createState() {
    return _ProgressFormState();
  }
}

class _ProgressFormState extends State<ProgressForm> {
  final _formKey = GlobalKey<FormState>();
  int _selectedImageIndex = -1;
  String? _title;
  String? _description;
  String? _image;

  Future<void> saveForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_image == null) return;

    _formKey.currentState!.save();

    await accountManager.addProgressTask(
      collectionID: widget.collection.id,
      description: _description!,
      image: _image!,
      title: _title!,
    );

    await widget.updateTasks();

    _closeForm();
  }

  String? _validateTitle(String title) {
    if (title.isEmpty || title.length < 5 || title.length > 20) {
      return "INVALID TITLE";
    }

    return null;
  }

  String? _validateDescription(String description) {
    if (description.isEmpty ||
        description.length < 10 ||
        description.length > 100) {
      return "INVALID DESCRIPTION";
    }

    return null;
  }

  void _saveTitle(String title) {
    _title = title;
  }

  void _saveDescription(String description) {
    _description = description;
  }

  void _saveImage({required String image, required int index}) {
    setState(() => _selectedImageIndex = index);
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
            const ProgressFormTitle(
              title: "Create Task",
            ),
            const SizedBox(
              height: 15,
            ),
            ProgressFormInput(
              label: "Name",
              validateInput: _validateTitle,
              saveInput: _saveTitle,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            ProgressFormInput(
              label: "Description",
              validateInput: _validateDescription,
              saveInput: _saveDescription,
              maxLines: null,
            ),
            const SizedBox(
              height: 15,
            ),
            ProgressFormPriority(
              selectedIndex: _selectedImageIndex,
              title: "Select Priority",
              saveImage: _saveImage,
            ),
            const SizedBox(
              height: 25,
            ),
            ProgressFormButton(
              saveForm: saveForm,
            ),
          ],
        ),
      ),
    );
  }
}
