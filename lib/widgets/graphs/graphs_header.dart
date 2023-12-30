import 'package:flutter/material.dart';

import './header/graphs_header_navbar.dart';
import './header/graphs_header_title.dart';

class GraphsHeader extends StatelessWidget {
  const GraphsHeader({
    required this.image,
    required this.title,
    super.key,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 65, 15, 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GraphsHeaderNavbar(
            onClose: () => Navigator.of(context).pop(),
          ),
          const SizedBox(
            height: 20,
          ),
          GraphsHeaderTitle(
            title: title,
          ),
        ],
      ),
    );
  }
}
