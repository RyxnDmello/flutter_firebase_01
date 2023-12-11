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

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeaderNavbar(
          onClose: () => Navigator.of(context).pop(),
          onOpenForm: null,
        ),
        const SizedBox(
          height: 20,
        ),
        HeaderController(
          totalTasks: completedLength,
          onOpenScreen: onOpenScreen,
          label: "Progress Tasks",
          onClear: null,
        ),
      ],
    );

    if (isProgress) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderNavbar(
            onClose: () => Navigator.of(context).pop(),
            onOpenForm: onOpenForm,
          ),
          const SizedBox(
            height: 15,
          ),
          HeaderTitle(
            name: collection.name,
            icon: collection.icon,
          ),
          const SizedBox(
            height: 10,
          ),
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
            label: "Completed Tasks",
            onClear: onClear,
          ),
        ],
      );
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
      child: content,
    );
  }
}
