import 'package:marvel_repository/marvel_repository.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
    'Thumbnail',
    () {
      test(
        '(de)serialization',
        () {
          final thumbnail = Thumbnail(path: "path", extension: "extension");
          expect(Thumbnail.fromJson(thumbnail.toJson()), equals(thumbnail));
        },
      );
    },
  );
}
