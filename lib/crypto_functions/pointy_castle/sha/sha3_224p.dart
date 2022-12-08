import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha3_224p extends Benchmark{
  const Sha3_224p(this.name) : super('SHA3 224 - $name');

  final String name;

  Uint8List sha3Digest(Uint8List dataToDigest){
    final d = SHA3Digest(224);

    return d.process(dataToDigest);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final hash = sha3Digest(utf8.encode(message) as Uint8List);
    //print('SHA3-224p: $hash');
  }
}