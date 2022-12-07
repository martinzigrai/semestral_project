import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/src/platform_check/platform_check.dart';

class EC_keypair_p{

  AsymmetricKeyPair<ECPublicKey, ECPrivateKey> generateKeys(SecureRandom secureRandom, int bitLength){
    late ECDomainParameters param;

    switch(bitLength){
      case 0: param = ECCurve_secp192r1();
        break;
      case 1: param = ECCurve_secp224r1();
        break;
      case 2: param = ECCurve_secp256r1();
        break;
      case 3: param = ECCurve_secp384r1();
        break;
      case 4: param = ECCurve_secp521r1();
        break;
      default: param = ECCurve_secp521r1();
    }
    var keyParams = ECKeyGeneratorParameters(param);

    final keyGen = ECKeyGenerator();
    keyGen.init(ParametersWithRandom(keyParams, secureRandom));

    final pair = keyGen.generateKeyPair();

    final myPublic = pair.publicKey as ECPublicKey;
    final myPrivate = pair.privateKey as ECPrivateKey;

    return AsymmetricKeyPair<ECPublicKey, ECPrivateKey>(myPublic, myPrivate);
  }

  SecureRandom exampleSecureRandom() {

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    return secureRandom;
  }

  void getEC_keypair() {
    final pair = generateKeys(exampleSecureRandom(), 0);
    final public = pair.publicKey;
    final private = pair.privateKey;

    print(public);
    print(private);
  }

}