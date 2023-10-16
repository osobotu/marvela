// import 'package:marvel_api/marvel_api.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:http/http.dart' as http;
// import 'package:test/test.dart';

// class MockHttpClient extends Mock implements http.Client {}

// class MockResponse extends Mock implements http.Response {}

// class FakeUri extends Fake implements Uri {}

// void main() {
//   group(
//     'MarvelApiClient',
//     () {
//       late http.Client httpClient;
//       late MarvelApiClient marvelApiClient;

//       setUpAll(() {
//         registerFallbackValue(FakeUri());
//       });

//       setUp(() {
//         httpClient = MockHttpClient();
//         marvelApiClient = MarvelApiClient(httpClient: httpClient);
//       });

//       group('constructor', () {
//         test('does not require an httpClient', () {
//           expect(MarvelApiClient(), isNotNull);
//         });
//       });

//       group(
//         'fetchCharacters',
//         () {
//           final ts = DateTime.now().second.toString();

//           final hash = HashGenerator().generateMD5Hash(ts);
//           const offset = 0;
//           const charactersLimit = '40';
//           test(
//             'makes correct http request',
//             () async {
//               final response = MockResponse();

//               when(() => response.statusCode).thenReturn(200);
//               when(() => response.body).thenReturn('{}');
//               when(() => httpClient.get(any()))
//                   .thenAnswer((_) async => response);
//               try {
//                 await marvelApiClient.fetchCharacters();
//               } catch (_) {}
//               verify(
//                 () => httpClient.get(
//                   Uri.https(
//                     'gateway.marvel.com:443',
//                     'v1/public/characters',
//                     {
//                       'limit': charactersLimit,
//                       'apikey': Env.apiKey,
//                       'hash': hash,
//                       'ts': ts,
//                       'offset': offset.toString(),
//                     },
//                   ),
//                 ),
//               ).called(1);
//             },
//           );
//           test('throws FetchCharactersRequestFailure on non-200 response',
//               () async {
//             final response = MockResponse();
//             when(() => response.statusCode).thenReturn(400);
//             when(() => httpClient.get(any())).thenAnswer((_) async => response);

//             expect(
//               () async => marvelApiClient.fetchCharacters(),
//               throwsA(isA<FetchCharactersRequestFailure>()),
//             );
//           });

//           test(
//             'throws NoCharactersFound on error response',
//             () async {
//               final response = MockResponse();
//               when(() => response.statusCode).thenReturn(200);
//               when(() => response.body).thenReturn('{}');
//               when(() => httpClient.get(any()))
//                   .thenAnswer((_) async => response);
//               await expectLater(
//                 marvelApiClient.fetchCharacters(),
//                 throwsA(isA<NoCharactersFound>()),
//               );
//             },
//           );

//           test(
//             'throws NoCharactersFound on empty response',
//             () async {
//               final response = MockResponse();
//               when(() => response.statusCode).thenReturn(200);
//               when(() => response.body).thenReturn('{"results": []}');
//               when(() => httpClient.get(any()))
//                   .thenAnswer((_) async => response);

//               await expectLater(
//                 marvelApiClient.fetchCharacters(),
//                 throwsA(isA<NoCharactersFound>()),
//               );
//             },
//           );

//           test(
//             'returns List<Character> on valid response',
//             () async {
//               final response = MockResponse();
//               when(() => response.statusCode).thenReturn(200);
//               when(() => response.body).thenReturn(
//                 '''
// { 
//   "data": {
//     "results": [
//      { 
//       "id": 1011176,
//       "name": "Ajak",
//       "description": "",
//       "modified": "1969-12-31T19:00:00-0500",
//       "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011176",
//       "thumbnail": {
//          "path": "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215",
//           "extension": "jpg"
//       }
//       }
//     ]
//   }

// }
// ''',
//               );
//               when(() => httpClient.get(any()))
//                   .thenAnswer((_) async => response);

//               final actual = await marvelApiClient.fetchCharacters();

//               expect(
//                 actual,
//                 isA<List<Character>>().having(
//                   (l) => l[0],
//                   'first character',
//                   isA<Character>()
//                       .having((c) => c.name, 'name', 'Ajak')
//                       .having((c) => c.id, 'id', 1011176)
//                       .having((c) => c.description, 'description', '')
//                       .having((c) => c.modifiedAt, 'modifiedAt',
//                           "1969-12-31T19:00:00-0500")
//                       .having((c) => c.resourceURI, 'resourceURI',
//                           "http://gateway.marvel.com/v1/public/characters/1011176")
//                       .having(
//                         (c) => c.thumbnail,
//                         'thumbnail',
//                         isA<Thumbnail>()
//                             .having((t) => t.path, 'path',
//                                 "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215")
//                             .having((t) => t.extension, 'extension', "jpg"),
//                       ),
//                 ),
//               );
//             },
//           );
//         },
//       );
//     },
//   );
// }
