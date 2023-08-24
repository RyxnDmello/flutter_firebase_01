import 'package:flutter/material.dart';
import 'package:flutter_firebase_01/widgets/collection/collection_block.dart';

import '../widgets/collection/collection_app_bar.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            CollectionAppBar(),
            SizedBox(
              height: 20,
            ),
            CollectionBlock(
              image: "./lib/images/collection/high.png",
            ),
            SizedBox(
              height: 15,
            ),
            CollectionBlock(
              image: "./lib/images/collection/medium.png",
            ),
            SizedBox(
              height: 15,
            ),
            CollectionBlock(
              image: "./lib/images/collection/low.png",
            ),
            SizedBox(
              height: 15,
            ),
            CollectionBlock(
              image: "./lib/images/collection/high.png",
            ),
            SizedBox(
              height: 15,
            ),
            CollectionBlock(
              image: "./lib/images/collection/medium.png",
            ),
            SizedBox(
              height: 15,
            ),
            CollectionBlock(
              image: "./lib/images/collection/low.png",
            ),
          ],
        ),
      ),
    );
  }
}
