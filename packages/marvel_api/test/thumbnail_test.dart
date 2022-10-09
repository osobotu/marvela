import 'package:marvel_api/marvel_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Thumbnail',
    () {
      group('fromJson', () {
        test(
          'returns the correct Thumbnail object',
          () {
            expect(
              Thumbnail.fromJson(<String, dynamic>{
                'path':
                    "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215",
                "extension": "jpg",
              }),
              isA<Thumbnail>()
                  .having((t) => t.path, 'path',
                      "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215")
                  .having((t) => t.extension, 'extension', 'jpg'),
            );
          },
        );
      });
    },
  );
}
