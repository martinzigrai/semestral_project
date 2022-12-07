import "package:pointycastle/export.dart";
import 'package:pointycastle/src/platform_check/platform_check.dart';
import '../rsa/rsa_keypair_p.dart';

import 'dart:convert';
import 'dart:typed_data';

class RSA_sign_verify_3072{
  Uint8List rsaSign(RSAPrivateKey privateKey, Uint8List dataToSign) {
    //final signer = Signer('SHA-256/RSA'); // Get using registry
    final signer = RSASigner(SHA256Digest(), '0609608648016503040201');

    // initialize with true, which means sign
    signer.init(true, PrivateKeyParameter<RSAPrivateKey>(privateKey));

    final sig = signer.generateSignature(dataToSign);

    return sig.bytes;
  }

  bool rsaVerify(
      RSAPublicKey publicKey, Uint8List signedData, Uint8List signature) {
    //final signer = Signer('SHA-256/RSA'); // Get using registry
    final sig = RSASignature(signature);

    final verifier = RSASigner(SHA256Digest(), '0609608648016503040201');

    // initialize with false, which means verify
    verifier.init(false, PublicKeyParameter<RSAPublicKey>(publicKey));

    try {
      return verifier.verifySignature(signedData, sig);
    } on ArgumentError {
      return false; // for Pointy Castle 1.0.2 when signature has been modified
    }
  }

  SecureRandom exampleSecureRandom() {

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    return secureRandom;
  }

  void getRSA_sign_verify(var text) {
    RSA_keypair_p kp = RSA_keypair_p();
    final pair = kp.generateRSAkeyPair(exampleSecureRandom(),2);

    final sign = rsaSign(pair.privateKey, utf8.encode(text) as Uint8List);
    print(sign);

    final verify = rsaVerify(pair.publicKey, utf8.encode(text) as Uint8List, sign);
    print(verify);
    
  }
}