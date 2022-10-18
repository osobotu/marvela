import 'package:marvel_api/marvel_api.dart' hide Character, Thumbnail;
import 'package:marvel_repository/marvel_repository.dart';

class MarvelRepository {
  MarvelRepository({MarvelApiClient? marvelApiClient})
      : _marvelApiClient = marvelApiClient ?? MarvelApiClient();

  final MarvelApiClient _marvelApiClient;

  Future<List<Character>> fetchCharacters([int offset = 0]) async {
    final characters = <Character>[];
    final charactersFromApiClient =
        await _marvelApiClient.fetchCharacters(offset);
    print('Fetch characters in repository called');
    for (var character in charactersFromApiClient) {
      characters.add(
        Character(
          id: character.id,
          name: character.name,
          description: character.description,
          modifiedAt: character.modifiedAt,
          resourceURI: character.resourceURI,
          thumbnail: Thumbnail(
            path: character.thumbnail.path,
            extension: character.thumbnail.extension,
          ),
        ),
      );
    }
    return characters;
  }
}
