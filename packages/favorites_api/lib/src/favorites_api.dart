import 'package:favorites_api/favorites_api.dart';

abstract class FavoritesApi {
  const FavoritesApi();

  Stream<List<FavoriteCharacter>> getFavorites();

  Future<void> saveCharacter(FavoriteCharacter character);

  Future<void> removeCharacter(int id);

  Future<List<FavoriteCharacter>> searchFavorites(String searchString);
}

class FavoriteCharacterNotFound implements Exception {}
