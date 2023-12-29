import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './header/header_navbar.dart';
import './header/header_controller.dart';
import './header/header_details.dart';
import './header/header_title.dart';

class Header extends StatelessWidget {
  const Header({
    required this.isProgress,
    required this.completedLength,
    required this.progressLength,
    required this.onOpenScreen,
    required this.onOpenForm,
    required this.collection,
    required this.onClear,
    super.key,
  });

  final CollectionModel collection;
  final bool isProgress;

  final Future<void> Function()? onClear;
  final void Function()? onOpenScreen;
  final void Function()? onOpenForm;
  final int? completedLength;
  final int? progressLength;

  @override
  Widget build(BuildContext context) {
    String getCompletedPercentage() {
      int total = progressLength! + completedLength!;

      if (total == 0) return "0.00";

      double percentage = (completedLength! * 100) / total;
      return percentage.toStringAsFixed(2);
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
          Hero(
            tag: "COLLECTION",
            child: HeaderNavbar(
              onClose: () => Navigator.of(context).pop(),
              onOpenForm: isProgress ? onOpenForm : null,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          HeaderTitle(
            name: collection.name,
            icon: collection.icon,
          ),
          if (isProgress)
            const SizedBox(
              height: 10,
            ),
          if (isProgress)
            HeaderDetails(
              active: progressLength.toString(),
              percentage: getCompletedPercentage(),
            ),
          const SizedBox(
            height: 10,
          ),
          HeaderController(
            totalTasks: completedLength,
            onOpenScreen: onOpenScreen,
            label: isProgress ? "Completed Tasks" : "Progress Tasks",
            onClear: isProgress ? onClear : null,
          ),
        ],
      ),
    );
  }
}
