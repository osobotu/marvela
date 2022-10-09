import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_api/env/env.dart';
import 'package:marvel_api/marvel_api.dart';
import 'package:marvel_api/src/hash.dart';

// exception thrown when fetchCharacters fails
class FetchCharactersRequestFailure implements Exception {}

class NoCharactersFound implements Exception {}

class MarvelApiClient {
  MarvelApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseMarvelUrl = 'gateway.marvel.com:443';

  final http.Client _httpClient;

  // Fetcher list of [Characters] from `/v1/public/characters`
  // ''' Query should include apiKey, ts (timestamp) and hash (md5 hash) '''
  Future<List<Character>> fetchCharacters() async {
    final ts = DateTime.now().second.toString();

    final hash = HashGenerator().generateMD5Hash(ts);
    final charactersListRequest = Uri.https(
      _baseMarvelUrl,
      'v1/public/characters',
      {
        'apikey': Env.apiKey,
        'hash': hash,
        'ts': ts,
      },
    );
    final charactersListResponse = await _httpClient.get(charactersListRequest);

    if (charactersListResponse.statusCode != 200) {
      throw FetchCharactersRequestFailure();
    }

    final characterDataBody = json.decode(charactersListResponse.body) as Map;
    if (!characterDataBody.containsKey('data')) {
      throw NoCharactersFound();
    }

    final results = characterDataBody['data']['results'] as List;

    if (results.isEmpty) throw NoCharactersFound();

    final characters = <Character>[];
    for (var character in results) {
      characters.add(Character.fromJson(character));
    }
    return characters;
  }
}
