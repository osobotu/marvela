// import 'dart:convert';

// import 'package:crypto/crypto.dart';
// import 'package:marvel_api/env/env.dart';
// import 'package:marvel_api/src/hash.dart';
// import 'package:mocktail/mocktail.dart';

// import 'package:test/test.dart';

// class MockHashGenerator extends Mock implements HashGenerator {
//   @override
//   String generateMD5Hash(String ts) {
//     const apiKey = Env.testPublicKey;
//     const privateKey = Env.testPrivateKey;
//     final dataToHash = ts + privateKey + apiKey;
//     final bytesToHash = utf8.encode(dataToHash);
//     final md5Hash = md5.convert(bytesToHash);

//     return md5Hash.toString();
//   }
// }

// void main() {
//   group('HashGenerator', () {
//     group(
//       'generateMD5Hash',
//       () {
//         test(
//           'generates the correct hash given the same parameters',
//           () {
//             const ts = '123456';

//             final hashGenerator = MockHashGenerator();
//             final generatedHash = hashGenerator.generateMD5Hash(ts);

//             // the [testHash] was generated at [https://www.md5hashgenerator.com/]
//             const testHash = '6c6b444b386c38e0f638176c6d160fb2';

//             expect(generatedHash, equals(testHash));
//           },
//         );
//       },
//     );
//   });
// }
