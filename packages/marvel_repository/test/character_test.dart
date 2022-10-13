import 'package:marvel_repository/marvel_repository.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
    'Character',
    () {
      test('(de)serialization works fine', () {
        final character = Character(
          id: 1,
          name: 'name',
          description: "description",
          modifiedAt: "modifiedAt",
          resourceURI: "resourceURI",
          thumbnail: Thumbnail(path: "path", extension: "extension"),
        );
        print(character.toJson());
        expect(
          Character.fromJson(character.toJson()),
          equals(character),
        );
      });
    },
  );
}
