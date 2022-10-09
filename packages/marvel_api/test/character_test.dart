import 'package:marvel_api/marvel_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Character',
    () {
      group('fromJson', () {
        test(
          'returns the correct Character object',
          () {
            expect(
              Character.fromJson(
                <String, dynamic>{
                  "id": 1011176,
                  "name": "Ajak",
                  "description": "description",
                  "modified": "1969-12-31T19:00:00-0500",
                  "thumbnail": {
                    "path":
                        "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215",
                    "extension": "jpg"
                  },
                  "resourceURI":
                      "http://gateway.marvel.com/v1/public/characters/1011176",
                },
              ),
              isA<Character>()
                  .having((t) => t.id, 'id', 1011176)
                  .having((t) => t.name, 'name', 'Ajak')
                  .having((t) => t.description, 'description', 'description')
                  .having((t) => t.modifiedAt, 'modified',
                      '1969-12-31T19:00:00-0500')
                  .having((t) => t.resourceURI, 'resourceURI',
                      'http://gateway.marvel.com/v1/public/characters/1011176')
                  .having(
                    (t) => t.thumbnail,
                    'Thumbnail',
                    isA<Thumbnail>()
                        .having((t) => t.path, 'path',
                            "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215")
                        .having((t) => t.extension, 'extension', 'jpg'),
                  ),
            );
          },
        );
      });
    },
  );
}
