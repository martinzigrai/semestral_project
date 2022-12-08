import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Sha_256p extends Benchmark{
  const Sha_256p(this.name) : super('SHA 256 - $name');

  final String name;

  Uint8List sha256Digest(Uint8List dataToDigest){
    final d = SHA256Digest();

    return d.process(dataToDigest);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final hash = sha256Digest(utf8.encode(message) as Uint8List);
    //print('SHA-256p: $hash');
  }
}