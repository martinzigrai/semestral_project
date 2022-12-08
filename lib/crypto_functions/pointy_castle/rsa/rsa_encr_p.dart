import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

import 'package:pointycastle/export.dart';
import 'package:pointycastle/src/platform_check/platform_check.dart';
import '../rsa/rsa_keypair_p.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

class RSA_encr_decr_p{
  Uint8List rsaEncrypt(RSAPublicKey myPublic, Uint8List dataToEncrypt) {
    final encryptor = OAEPEncoding(RSAEngine())
      ..init(true, PublicKeyParameter<RSAPublicKey>(myPublic)); // true=encrypt

    return _processInBlocks(encryptor, dataToEncrypt);
  }

  Uint8List rsaDecrypt(RSAPrivateKey myPrivate, Uint8List cipherText) {
    final decryptor = OAEPEncoding(RSAEngine())
      ..init(false, PrivateKeyParameter<RSAPrivateKey>(myPrivate)); // false=decrypt

    return _processInBlocks(decryptor, cipherText);
  }

  Uint8List _processInBlocks(AsymmetricBlockCipher engine, Uint8List input) {
    final numBlocks = input.length ~/ engine.inputBlockSize +
        ((input.length % engine.inputBlockSize != 0) ? 1 : 0);

    final output = Uint8List(numBlocks * engine.outputBlockSize);

    var inputOffset = 0;
    var outputOffset = 0;
    while (inputOffset < input.length) {
      final chunkSize = (inputOffset + engine.inputBlockSize <= input.length)
          ? engine.inputBlockSize
          : input.length - inputOffset;

      outputOffset += engine.processBlock(
          input, inputOffset, chunkSize, output, outputOffset);

      inputOffset += chunkSize;
    }

    return (output.length == outputOffset)
        ? output
        : output.sublist(0, outputOffset);
  }

  SecureRandom exampleSecureRandom() {

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(Platform.instance.platformEntropySource().getBytes(32)));
    return secureRandom;
  }

  void getRSA_encr_decr(var text) {
    RSA_keypair_p kp = RSA_keypair_p();
    final pair = kp.generateRSAkeyPair(exampleSecureRandom(),0);

    final encr = rsaEncrypt(pair.publicKey, utf8.encode(text) as Uint8List);
    final decr = rsaDecrypt(pair.privateKey, encr);
    //print(encr);
    //print(utf8.decode(decr));
  }
}