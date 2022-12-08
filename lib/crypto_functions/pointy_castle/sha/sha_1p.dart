import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha_1p extends Benchmark{
  const Sha_1p(this.name) : super('SHA1 - $name');

  final String name;

  Uint8List sha1Digest(Uint8List dataToDigest){
    final d = SHA1Digest();

    return d.process(dataToDigest);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final hash = sha1Digest(utf8.encode(message) as Uint8List);
    //print('SHA-1p: $hash');
  }
}