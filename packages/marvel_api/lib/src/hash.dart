import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashGenerator {
  String generateMD5Hash(String ts) {
    String privateKey = const String.fromEnvironment('PRIVATE_KEY');
    String publicKey = const String.fromEnvironment('PUBLIC_KEY');
    final dataToHash = ts + privateKey + publicKey;
    final bytesToHash = utf8.encode(dataToHash);
    final md5Hash = md5.convert(bytesToHash);

    return md5Hash.toString();
  }
}
