import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:marvel_api/env/env.dart';

class HashGenerator {
  String generateMD5Hash(String ts) {
    // final dataToHash = ts + Env.privateKey + Env.apiKey;
    final dataToHash = ts +
        const String.fromEnvironment('PRIVATE_KEY') +
        const String.fromEnvironment('PUBLIC_KEY');
    final bytesToHash = utf8.encode(dataToHash);
    final md5Hash = md5.convert(bytesToHash);

    return md5Hash.toString();
  }
}
