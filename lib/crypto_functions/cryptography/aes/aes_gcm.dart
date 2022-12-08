import 'dart:convert';
import 'package:cryptography/cryptography.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends AsyncBenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_gcm extends Benchmark{
  const Aes_gcm(this.name) : super('AES-gcm $name');

  final name;

  @override
  Future<void> run() async{
    final message = utf8.encode('abcdefghijklmnop');

    final algorithm = AesGcm.with128bits();
    final secretKey = await algorithm.newSecretKey();
    final nonce = algorithm.newNonce();

    // Encrypt
    final secretBox = await algorithm.encrypt(
      message,
      secretKey: secretKey,
      nonce: nonce,
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