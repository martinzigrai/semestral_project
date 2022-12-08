import 'dart:convert';
import 'package:cryptography/cryptography.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends AsyncBenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha_384 extends Benchmark{
  const Sha_384(this.name) : super('SHA 384 $name');

  final name;

  @override
  Future<void> run() async{
    final message = utf8.encode('abcdefghijklmnop');
    final algorithm = Sha384();
    final hash = await algorithm.hash(message);
    //print('Hash SHA384: ${hash.bytes}');
  }
}