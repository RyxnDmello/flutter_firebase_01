import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/task_provider.dart';

import '../../models/collection_model.dart';
import '../../models/task_model.dart';

import './form/progress_form_title.dart';
import './form/progress_form_input.dart';
import './form/progress_form_priority.dart';
import './form/progress_form_button.dart';

class ProgressForm extends ConsumerStatefulWidget {
  const ProgressForm({
    required this.updateProgressTasks,
    required this.collection,
    super.key,
  });

  final void Function({required List<TaskModel> tasks}) updateProgressTasks;
  final CollectionModel collection;

  @override
  ConsumerState<ProgressForm> createState() {
    return _ProgressFormState();
  }
}

class _ProgressFormState extends ConsumerState<ProgressForm> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;
  String? _image;

  String? _validateTitle(String title) {
    if (title.isEmpty || title.length < 5 || title.length > 15) {
      return "INVALID TITLE";
    }

    return null;
  }

  String? _validateDescription(String description) {
    if (description.isEmpty ||
        description.length < 5 ||
        description.length > 60) {
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

  void _saveImage(String image) {
    _image = image;
  }

  @override
  Widget build(BuildContext context) {
    final taskProviderRef = ref.watch(taskProvider.notifier);

    Future<void> saveForm() async {
      if (!_formKey.currentState!.validate()) return;
      if (_image == null) return;

      _formKey.currentState!.save();

      await taskProviderRef.addProgressTask(
        collectionID: widget.collection.id,
        title: _title!,
        description: _description!,
        image: _image!,
      );

      widget.updateProgressTasks(
        tasks: await taskProviderRef.getProgressTasks(
          collectionID: widget.collection.id,
        ),
      );

      Navigator.of(context).pop();
    }

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
            const ProgressFormTitle(),
            const SizedBox(
              height: 10,
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
              height: 15,
            ),
            ProgressFormPriority(
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
