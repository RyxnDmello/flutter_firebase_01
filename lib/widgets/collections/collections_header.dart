import 'package:flutter/material.dart';

import './header/collections_header_navbar.dart';
import './header/collections_header_title.dart';
import './header/collections_header_controller.dart';

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({
    required this.onOpenGraph,
    required this.onOpenForm,
    required this.background,
    required this.onRefresh,
    required this.onClose,
    required this.image,
    required this.title,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final void Function()? onOpenGraph;
  final void Function() onOpenForm;
  final void Function() onClose;
  final String background;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 65, 15, 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            background,
          ),
          fit: BoxFit.cover,
          opacity: 0.65,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CollectionsHeaderNavbar(
            onRefresh: onRefresh,
            onOpenForm: onOpenForm,
            onBack: onClose,
          ),
          const SizedBox(
            height: 20,
          ),
          CollectionsHeaderTitle(
            image: image,
            title: title,
          ),
          SizedBox(
            height: onOpenGraph == null ? 10 : 20,
          ),
          if (onOpenGraph != null)
            CollectionsHeaderController(
              onOpenGraph: onOpenGraph!,
            ),
        ],
      ),
    );
  }
}
