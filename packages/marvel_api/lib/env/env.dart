import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'PUBLIC_KEY', obfuscate: true)
  static final apiKey = _Env.apiKey;
  @EnviedField(varName: 'PRIVATE_KEY', obfuscate: true)
  static final privateKey = _Env.privateKey;

  @EnviedField(varName: 'TEST_PUBLIC_KEY')
  static const testPublicKey = _Env.testPublicKey;
  @EnviedField(varName: 'TEST_PRIVATE_KEY')
  static const testPrivateKey = _Env.testPrivateKey;
}
