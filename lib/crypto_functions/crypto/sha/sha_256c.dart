import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha_256c extends Benchmark {
  const Sha_256c(this.name) : super('SHA-256 $name');

  final String name;

  @override
  void run(){
    var message = utf8.encode('abcdefghijklmnop');
    var digest = sha256.convert(message);

    //print(digest.bytes);
    //print(digest);

  }

}