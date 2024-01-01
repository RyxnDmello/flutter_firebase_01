import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../database/progress_manager.dart';

import '../../models/collection_model.dart';

import '../common/calendar.dart';
import '../common/loading_indicator.dart';

import './form/progress_form_title.dart';
import './form/progress_form_input.dart';
import './form/progress_form_priority.dart';
import './form/progress_form_date.dart';
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
  int _selectedOption = -1;
  String? _description;
  String? _duration;
  String? _title;
  int? _priority;
  String? _date;

  Future<void> saveForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_priority == null || (_date == null && _duration == null)) return;

    _formKey.currentState!.save();

    showLoadingIndicator(
      context: context,
    );

    await progressManager.addTask(
      collectionID: widget.collection.id,
      description: _description!,
      date: _date ?? _duration!,
      priority: _priority!,
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
        description.length > 200) {
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

  Future<void> _saveDate() async {
    final selectedDate = await openDatePicker(
      context: context,
    );

    if (selectedDate == null) return;

    setState(() {
      _date = DateFormat("yyyy-MM-dd").format(selectedDate);
      _selectedOption = -1;
    });

    _duration = null;
  }

  void _saveDuration({
    required int duration,
    required int index,
  }) {
    String day = "${DateTime.now().day + duration}";
    String month = "${DateTime.now().month}";
    String year = "${DateTime.now().year}";

    if (int.parse(day) > 30) {
      day = "${int.parse(day) - 30}";
      month = int.parse(month) == 12 ? "01" : "12";
      year = "${int.parse(year) + 1}";
    }

    if (month.length != 2) month = "0$month";
    if (day.length != 2) day = "0$day";

    _duration = "$year-$month-$day";

    setState(() {
      _selectedOption = index;
      _date = null;
    });
  }

  void _closeForm() {
    Navigator.of(context).pop();
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
              lines: 1,
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
              onSavePriority: _savePriority,
              selected: _priority ?? -1,
            ),
            const SizedBox(
              height: 25,
            ),
            ProgressFormDate(
              title: "Select Duration",
              onSaveOption: _saveDuration,
              selectedOption: _selectedOption,
              onSaveDate: _saveDate,
              savedDate: _date,
            ),
            const SizedBox(
              height: 30,
            ),
            ProgressFormButton(
              label: "Create Task",
              saveForm: saveForm,
            ),
          ],
        ),
      ),
    );
  }
}
