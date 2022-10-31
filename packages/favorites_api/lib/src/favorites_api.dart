import 'package:marvel_repository/marvel_repository.dart' show Character;

abstract class FavoritesApi {
  const FavoritesApi();

  Stream<List<Character>> getFavorites();

  Future<void> saveCharacter(Character character);

  Future<void> removeCharacter(int id);

  Future<List<Character>> searchFavorites();
}
