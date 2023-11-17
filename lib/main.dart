import 'package:Marvela/app.dart';
import 'package:Marvela/core/services/firebase_analytics_service.dart';
import 'package:Marvela/firebase_options.dart';
import 'package:favorites_repository/favorites_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_favorites_api/local_storage_favorites_api.dart';
import 'package:marvel_repository/marvel_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final favoritesApi = LocalStorageFavoritesApi(
    plugin: await SharedPreferences.getInstance(),
  );

  final favoritesRepository = FavoritesRepository(favoritesApi: favoritesApi);
  final marvelRepository = MarvelRepository();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    AnalyticsService.init();
    AnalyticsService.observer;
  } catch (e) {
    print('Failed to initialize firebase');
  }

  runApp(
    MarvelaApp(
      marvelRepository: marvelRepository,
      favoritesRepository: favoritesRepository,
    ),
  );
}
