import 'package:ninja/ninja.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class RSA_sign_verify_2048_n extends Benchmark{
  const RSA_sign_verify_2048_n(this.name) : super('RSA 2048 - $name');

  final String name;

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final privateKey = RSAPrivateKey.generate(2048);
    final publicKey = privateKey.toPublicKey;

    final signature = privateKey.signPssToBase64(message);
    final verify = publicKey.verifySsaPss(signature, message);

    //print(signature);
    //print(verify);
  }

}