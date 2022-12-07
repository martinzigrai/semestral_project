import 'package:ninja/ninja.dart';

class RSA_sign_verify_2048_n{

  void getRSA_sign_verify_n(var text) {
    final privateKey = RSAPrivateKey.generate(2048);
    final publicKey = privateKey.toPublicKey;

    final signature = privateKey.signPssToBase64(text);
    final verify = publicKey.verifySsaPss(signature, text);

    print(signature);
    print(verify);
  }

}