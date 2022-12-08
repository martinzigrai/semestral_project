import 'dart:convert';
import 'package:cryptography/cryptography.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends AsyncBenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_cbc extends Benchmark{
  const Aes_cbc(this.name) : super('AES-cbc $name');

  final name;

  @override
  Future<void> run() async{
    final message = utf8.encode('abcdefghijklmnop');

    final algorithm = AesCbc.with128bits(macAlgorithm: Hmac.sha256(),);
    final secretKey = await algorithm.newSecretKey();
    final nonce = algorithm.newNonce();

    // Encrypt
    final secretBox = await algorithm.encrypt(
      message,
      secretKey: secretKey,
    );
    //print('Ciphertext: ${secretBox.cipherText}');

    // Decrypt
    final clearText = await algorithm.decrypt(
      secretBox,
      secretKey: secretKey,
    );
    //print('Cleartext: $clearText');
    //print(utf8.decode(clearText));
  }
}

