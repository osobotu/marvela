import 'package:marvel_api/marvel_api.dart' as marvel_api;
import 'package:marvel_repository/src/marvel_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'package:test/test.dart';

import 'package:marvel_repository/marvel_repository.dart';

class MockMarvelApiClient extends Mock implements marvel_api.MarvelApiClient {}

class MockCharacter extends Mock implements marvel_api.Character {}

class MockThumbnail extends Mock implements marvel_api.Thumbnail {}

void main() {
  group(
    'MarvelRepository',
    () {
      late marvel_api.MarvelApiClient marvelApiClient;
      late MarvelRepository marvelRepository;

      setUp(() {
        marvelApiClient = MockMarvelApiClient();
        marvelRepository = MarvelRepository(marvelApiClient: marvelApiClient);
      });

      group(
        'constructor',
        () {
          test(
            'instantiates internal weather api client when not injected',
            () {
              expect(MarvelRepository(), isNotNull);
            },
          );
        },
      );

      group(
        'fetchCharacters',
        () {
          test('calls fetchCharacters in MarvelApiClient', () async {
            try {
              await marvelApiClient.fetchCharacters();
            } catch (_) {}
            verify(() => marvelApiClient.fetchCharacters()).called(1);
          });

          test(
            'throws when fetchCharacters fails',
            () {
              final exception = Exception('oops');
              when(() => marvelApiClient.fetchCharacters())
                  .thenThrow(exception);
              expect(
                () async => marvelRepository.fetchCharacters(),
                throwsA(exception),
              );
            },
          );

          test(
            'returns List<Character> on success',
            () async {
              final character = MockCharacter();
              final thumbnail = MockThumbnail();
              when(() => character.id).thenReturn(1);
              when(() => character.name).thenReturn('name');
              when(() => character.description).thenReturn('description');
              when(() => character.modifiedAt).thenReturn('modifiedAt');
              when(() => character.resourceURI).thenReturn('resourceURI');
              when(() => character.thumbnail).thenReturn(thumbnail);
              when(() => thumbnail.path).thenReturn('path');
              when(() => thumbnail.extension).thenReturn('extension');
              when(() => marvelApiClient.fetchCharacters())
                  .thenAnswer((_) async => [character]);

              final actual = await marvelRepository.fetchCharacters();
              expect(actual, [
                Character(
                  id: 1,
                  name: "name",
                  description: "description",
                  modifiedAt: "modifiedAt",
                  resourceURI: "resourceURI",
                  thumbnail: Thumbnail(path: "path", extension: 'extension'),
                ),
              ]);
            },
          );
        },
      );
    },
  );
}
