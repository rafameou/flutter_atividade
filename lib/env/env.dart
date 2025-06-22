import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'DEEPL_API', obfuscate: true)
  static String deeplApi = _Env.deeplApi;
}
