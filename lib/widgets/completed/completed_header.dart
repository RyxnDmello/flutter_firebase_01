import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './header/completed_header_title.dart';
import './header/completed_header_controller.dart';

class CompletedHeader extends StatelessWidget {
  const CompletedHeader({
    required this.collection,
    required this.totalTasks,
    super.key,
  });

  final CollectionModel collection;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
      ),
      height: 140,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            collection.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompletedHeaderTitle(
                  name: collection.name,
                  icon: collection.icon,
                ),
                const SizedBox(
                  height: 10,
                ),
                CompletedHeaderController(
                  totalTasks: totalTasks,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
