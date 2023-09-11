import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/collection_provider.dart';

import '../models/collection_model.dart';

import '../widgets/collection/collection_app_bar.dart';
import '../widgets/collection/collection_block.dart';
import '../widgets/collection/collection_form.dart';
import '../widgets/collection/collection_empty.dart';

class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({
    required this.collections,
    super.key,
  });

  final List<CollectionModel> collections;

  @override
  ConsumerState<CollectionScreen> createState() {
    return _CollectionScreenState();
  }
}

class _CollectionScreenState extends ConsumerState<CollectionScreen> {
  List<CollectionModel> _collections = [];

  @override
  void initState() {
    super.initState();
    _collections = widget.collections;
  }

  void _updateCollections({required List<CollectionModel> collections}) {
    setState(() => _collections = collections);
  }

  void _openForm() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return CollectionForm(
          updateCollections: _updateCollections,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final collectionProviderRef = ref.watch(collectionProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () async => _updateCollections(
            collections: await collectionProviderRef.getCollections(),
          ),
          icon: const Icon(
            Icons.refresh_outlined,
          ),
          iconSize: 26.5,
        ),
        actions: [
          IconButton(
            onPressed: () => _openForm(),
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            const CollectionAppBar(),
            const SizedBox(
              height: 20,
            ),
            if (_collections.isNotEmpty)
              ..._collections.map(
                (collection) {
                  return Column(
                    children: [
                      CollectionBlock(
                        collection: collection,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              ),
            if (_collections.isEmpty)
              CollectionEmpty(
                openForm: _openForm,
              ),
          ],
        ),
      ),
    );
  }
}
