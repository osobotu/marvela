import 'package:favorites_api/favorites_api.dart';

class FavoritesRepository {
  final FavoritesApi _favoritesApi;

  FavoritesRepository({required FavoritesApi favoritesApi})
      : _favoritesApi = favoritesApi;

  Stream<List<FavoriteCharacter>> getFavorites() =>
      _favoritesApi.getFavorites();

  Future<void> saveCharacter(FavoriteCharacter character) =>
      _favoritesApi.saveCharacter(character);

  Future<void> removeCharacter(int id) => _favoritesApi.removeCharacter(id);
}
