import 'package:flutter/material.dart';

import '../database/collection_manager.dart';

import '../models/collection_model.dart';

import '../widgets/splash/splash_message.dart';
import '../widgets/splash/splash_title.dart';

import './collections.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<List<CollectionModel>> _collections() async {
    return await collectionManager.collections;
  }

  void _openCollectionsScreen({
    required List<CollectionModel> collections,
  }) {
    Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CollectionsScreen(
            collections: collections,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CollectionModel>>(
      future: _collections(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _openCollectionsScreen(
            collections: snapshot.data!,
          );
        }

        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "./lib/images/register/background.png",
                ),
                fit: BoxFit.cover,
                opacity: 0.65,
              ),
              color: Colors.black,
            ),
            child: const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SplashTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  SplashMessage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
