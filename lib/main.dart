import 'package:Marvela/app.dart';
import 'package:favorites_repository/favorites_repository.dart';
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

  runApp(
    MarvelaApp(
      marvelRepository: marvelRepository,
      favoritesRepository: favoritesRepository,
    ),
  );
}
