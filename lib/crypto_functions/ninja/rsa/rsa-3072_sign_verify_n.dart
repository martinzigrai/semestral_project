import 'package:ninja/ninja.dart';

class RSA_sign_verify_3072_n{

  void getRSA_sign_verify_n(var text) {
    final privateKey = RSAPrivateKey.generate(3072);
    final publicKey = privateKey.toPublicKey;

    final signature = privateKey.signPssToBase64(text);
    final verify = publicKey.verifySsaPss(signature, text);

    print(signature);
    print(verify);
  }

}