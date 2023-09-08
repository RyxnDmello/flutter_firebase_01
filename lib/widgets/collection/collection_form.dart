import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/collection_provider.dart';

import '../../models/collection_model.dart';
import '../../models/icon_model.dart';

import './form/collection_form_title.dart';
import './form/collection_form_input.dart';
import './form/collection_form_icon.dart';
import './form/collection_form_priority.dart';
import './form/collection_form_button.dart';

class CollectionForm extends ConsumerStatefulWidget {
  const CollectionForm({
    required this.updateCollection,
    super.key,
  });

  final void Function(List<CollectionModel> collection) updateCollection;

  @override
  ConsumerState<CollectionForm> createState() {
    return _CollectionFormState();
  }
}

class _CollectionFormState extends ConsumerState<CollectionForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  IconData? _icon;
  String? _image;

  String? _validateName(String name) {
    if (name.isEmpty ||
        name.split(' ').length > 2 ||
        name.length < 2 ||
        name.length > 15) {
      return "INVALID COLLECTION NAME";
    }

    return null;
  }

  String? _validateIcon(String name) {
    if (name == "Icon") {
      return "PLEASE SELECT AN ICON";
    }

    return null;
  }

  void _saveName(String name) {
    _name = name.toUpperCase();
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
    final collectionProviderRef = ref.watch(collectionProvider.notifier);

    Future<void> saveForm() async {
      if (!_formKey.currentState!.validate()) return;
      if (_image == null) return;

      _formKey.currentState!.save();

      collectionProviderRef.addCollection(
        name: _name!,
        icon: _icon!,
        image: _image!,
      );

      widget.updateCollection(
        await collectionProviderRef.getCollections(),
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
              height: 15,
            ),
            CollectionFormPriority(
              saveImage: _saveImage,
            ),
            const SizedBox(
              height: 25,
            ),
            CollectionFormButton(
              saveForm: saveForm,
            ),
          ],
        ),
      ),
    );
  }
}
