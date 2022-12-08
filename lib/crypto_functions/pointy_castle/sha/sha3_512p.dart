import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha3_512p extends Benchmark{
  const Sha3_512p(this.name) : super('SHA3 512 - $name');

  final String name;

  Uint8List sha512Digest(Uint8List dataToDigest){
    final d = SHA3Digest(512);

    return d.process(dataToDigest);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final hash = sha512Digest(utf8.encode(message) as Uint8List);
    //print('SHA3-512p: $hash');
  }
}