import 'dart:convert';
import 'package:cryptography/cryptography.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends AsyncBenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Ed_25519 extends Benchmark{
  const Ed_25519(this.name) : super('Ed-25519 $name');

  final name;

  @override
  Future<void> run() async{
    final message = utf8.encode('abcdefghijklmnop');
    final algorithm = Ed25519();

    final keyPair = await algorithm.newKeyPair();

    //final message = utf8.encode(text);
    final signature = await algorithm.sign(message, keyPair: keyPair);
    //print('Signature bytes: ${signature.bytes}');
    //print('Public key: ${signature.publicKey}');

    final isSignatureCorrect = await algorithm.verify(message, signature: signature);
    //print('$isSignatureCorrect');

  }

}