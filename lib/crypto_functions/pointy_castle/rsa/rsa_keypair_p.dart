import 'dart:math';
import 'dart:typed_data';
import 'package:pointycastle/src/platform_check/platform_check.dart';
import 'package:pointycastle/export.dart';

class RSA_keypair_p{
  AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRSAkeyPair(SecureRandom secureRandom, int bitLength) {
    // Create an RSA key generator and initialize it

    late RSAKeyGeneratorParameters param;
    switch(bitLength){
      case 0: param = RSAKeyGeneratorParameters(BigInt.parse('65537'), 1024, 64);
      break;
      case 1: param = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64);
      break;
      case 2: param = RSAKeyGeneratorParameters(BigInt.parse('65537'), 3072, 64);
      break;
      default: param = RSAKeyGeneratorParameters(BigInt.parse('65537'), 3072, 64);
    }

    // final keyGen = KeyGenerator('RSA'); // Get using registry
    final keyGen = RSAKeyGenerator();

    //keyGen.init(ParametersWithRandom(RSAKeyGeneratorParameters(BigInt.parse('65537'), bitLength, 64), secureRandom));

    keyGen.init(ParametersWithRandom(param, secureRandom));

    // Use the generator

    final pair = keyGen.generateKeyPair();

    // Cast the generated key pair into the RSA key types

    final myPublic = pair.publicKey as RSAPublicKey;
    final myPrivate = pair.privateKey as RSAPrivateKey;

    return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(myPublic, myPrivate);
  }

  SecureRandom exampleSecureRandom() {

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    return secureRandom;
  }

  void getRSA_keypair() {
    final pair = generateRSAkeyPair(exampleSecureRandom(),0);
    final public = pair.publicKey;
    final private = pair.privateKey;

    print(public);
    print(private);
  }
}
