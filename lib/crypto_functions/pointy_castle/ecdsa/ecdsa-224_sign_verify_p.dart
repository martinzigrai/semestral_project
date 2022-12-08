import "package:pointycastle/export.dart";
import 'package:pointycastle/src/platform_check/platform_check.dart';
import '../ecdsa/ec_keypair_p.dart';

import 'dart:convert';
import 'dart:typed_data';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class ECDSA_sign_verify_224 extends Benchmark{
  const ECDSA_sign_verify_224(this.name) : super('ECDSA 224 - $name');

  final String name;

  ECSignature ECDSASign(ECPrivateKey privateKey, Uint8List dataToSign, SecureRandom secureRandom) {
    //final signer = ECDSASigner(SHA256Digest(),null);

    final signer = Signer('SHA-256/ECDSA');
    var keyParam = PrivateKeyParameter<ECPrivateKey>(privateKey);
    // initialize with true, which means sign
    signer.init(true, ParametersWithRandom(keyParam, secureRandom));

    final sig = signer.generateSignature(dataToSign);

    return sig as ECSignature;
  }

  bool ECDSAVerify(ECPublicKey publicKey, Uint8List signedData, ECSignature signature) {
    final sig = signature;

    final verifier = Signer('SHA-256/ECDSA');

    // initialize with false, which means verify
    var keyParam = PublicKeyParameter<ECPublicKey>(publicKey);
    verifier.init(false, keyParam);

    try {
      return verifier.verifySignature(signedData, sig);
    } on ArgumentError {
      return false;
    }
  }

  SecureRandom exampleSecureRandom() {

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    return secureRandom;
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    EC_keypair_p kp = EC_keypair_p();
    final pair = kp.generateKeys(exampleSecureRandom(), 1);

    final sign = ECDSASign(pair.privateKey, utf8.encode(message) as Uint8List, exampleSecureRandom());
    //print(sign);

    final verify = ECDSAVerify(pair.publicKey, utf8.encode(message) as Uint8List, sign);
    //print(verify);
  }
}