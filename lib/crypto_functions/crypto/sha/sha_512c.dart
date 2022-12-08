import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha_512c extends Benchmark {
  const Sha_512c(this.name) : super('SHA-512 $name');

  final String name;


  @override
  void run(){
    var message = utf8.encode('abcdefghijklmnop');
    var digest = sha512.convert(message);

    //print(digest.bytes);
    //print(digest);

  }

}