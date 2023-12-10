import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './header/progress_header_navbar.dart';
import './header/progress_header_controller.dart';
import './header/progress_header_details.dart';
import './header/progress_header_title.dart';

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    required this.completedLength,
    required this.progressLength,
    required this.onOpenScreen,
    required this.onOpenForm,
    required this.collection,
    required this.onClear,
    super.key,
  });

  final Future<void> Function() onClear;
  final void Function() onOpenScreen;
  final void Function() onOpenForm;
  final CollectionModel collection;
  final int completedLength;
  final int progressLength;

  @override
  Widget build(BuildContext context) {
    double getCompletedPercentage() {
      int total = progressLength + completedLength;
      if (total == 0) return 0;
      return (completedLength * 100) / total;
    }

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            collection.image,
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressHeaderNavbar(
            onOpenForm: onOpenForm,
          ),
          const SizedBox(
            height: 15,
          ),
          ProgressHeaderTitle(
            name: collection.name,
            icon: collection.icon,
          ),
          const SizedBox(
            height: 10,
          ),
          ProgressHeaderDetails(
            active: progressLength.toString(),
            percentage: getCompletedPercentage().toStringAsFixed(2),
          ),
          const SizedBox(
            height: 10,
          ),
          ProgressHeaderController(
            openCompletedScreen: onOpenScreen,
            clearCollection: onClear,
          ),
        ],
      ),
    );
  }
}
