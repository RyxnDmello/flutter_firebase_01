import 'package:flutter/material.dart';

import '../../database/progress_manager.dart';

import '../../models/collection_model.dart';

import './form/progress_form_title.dart';
import './form/progress_form_input.dart';
import './form/progress_form_priority.dart';
import 'form/progress_form_duration.dart';
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
  String? _description;
  int _background = -1;
  int _priority = -1;
  String? _title;

  Future<void> saveForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_background == -1 || _priority == -1) return;

    _formKey.currentState!.save();

    await progressManager.addTask(
      collectionID: widget.collection.id,
      description: _description!,
      background: _background,
      priority: _priority,
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

  void _savePriority({required int index}) {
    setState(() => _priority = index);
  }

  void _saveBackground({required int index}) {
    setState(() => _background = index);
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
            ),
            const SizedBox(
              height: 15,
            ),
            ProgressFormInput(
              label: "Description",
              validateInput: _validateDescription,
              saveInput: _saveDescription,
            ),
            const SizedBox(
              height: 25,
            ),
            ProgressFormPriority(
              title: "Select Priority",
              selectedIndex: _priority,
              onSavePriority: _savePriority,
            ),
            const SizedBox(
              height: 25,
            ),
            ProgressFormDuration(
              onSaveBackground: _saveBackground,
              title: "Select Duration",
              selectedIndex: _background,
            ),
            const SizedBox(
              height: 30,
            ),
            ProgressFormButton(
              saveForm: saveForm,
              label: "Create Task",
            ),
          ],
        ),
      ),
    );
  }
}
