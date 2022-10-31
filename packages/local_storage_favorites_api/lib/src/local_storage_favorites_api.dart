import 'dart:convert';

import 'package:favorites_api/favorites_api.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageFavoritesApi extends FavoritesApi {
  final SharedPreferences _plugin;

  LocalStorageFavoritesApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final _favoriteCharactersStreamController =
      BehaviorSubject<List<FavoriteCharacter>>.seeded(const []);

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final favoritesCharacterJson = _getValue(kFavoriteCharactersCollectionKey);
    if (favoritesCharacterJson != null) {
      final favoriteCharacters = List<Map<dynamic, dynamic>>.from(
              jsonDecode(favoritesCharacterJson))
          .map((jsonMap) =>
              FavoriteCharacter.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _favoriteCharactersStreamController.add(favoriteCharacters);
    } else {
      _favoriteCharactersStreamController.add(const []);
    }
  }

  @visibleForTesting
  static const kFavoriteCharactersCollectionKey =
      '__favorite_characters_collection_key__';

  @override
  Stream<List<FavoriteCharacter>> getFavorites() =>
      _favoriteCharactersStreamController.asBroadcastStream();

  @override
  Future<void> removeCharacter(int id) {
    final favoriteCharacters = [..._favoriteCharactersStreamController.value];
    final favoriteCharacterIndex =
        favoriteCharacters.indexWhere((element) => element.id == id);

    if (favoriteCharacterIndex == -1) {
      throw FavoriteCharacterNotFound();
    } else {
      favoriteCharacters.removeAt(favoriteCharacterIndex);
      _favoriteCharactersStreamController.add(favoriteCharacters);
      return _setValue(
          kFavoriteCharactersCollectionKey, json.encode(favoriteCharacters));
    }
  }

  @override
  Future<void> saveCharacter(FavoriteCharacter character) {
    final favoriteCharacters = [..._favoriteCharactersStreamController.value];
    final favoriteCharacterIndex =
        favoriteCharacters.indexWhere((element) => element.id == character.id);
    if (favoriteCharacterIndex >= 0) {
      favoriteCharacters[favoriteCharacterIndex] = character;
    } else {
      favoriteCharacters.add(character);
    }

    _favoriteCharactersStreamController.add(favoriteCharacters);
    return _setValue(
        kFavoriteCharactersCollectionKey, json.encode(favoriteCharacters));
  }

  @override
  Future<List<FavoriteCharacter>> searchFavorites(String searchString) {
    // TODO: implement searchFavorites
    throw UnimplementedError();
  }
}
