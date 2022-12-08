import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

import 'package:pointycastle/export.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_ccm_p extends Benchmark{
  const Aes_ccm_p(this.name) : super('AES-ccm - $name');

  final String name;

  Uint8List aesCCMEncrypt(Uint8List key, Uint8List paddedPlaintext){
    assert([128, 192, 256].contains(key.length * 8));

    final cipher = CCMBlockCipher(AESEngine())..init(true, AEADParameters(KeyParameter(key), 16*8, Uint8List(12), Uint8List(0)));
    return cipher.process(paddedPlaintext);
  }

  Uint8List aesCCMDecrypt(Uint8List key, Uint8List cipherText){
    assert([128, 192, 256].contains(key.length * 8));

    final cipher = CCMBlockCipher(AESEngine())..init(false, AEADParameters(KeyParameter(key), 16*8, Uint8List(12), Uint8List(0)));
    return cipher.process(cipherText);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final cypher = aesCCMEncrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode(message) as Uint8List);
    final decr = aesCCMDecrypt(utf8.encode('MartinMartinMart') as Uint8List, cypher);

    //print(cypher);
    //print(decr);
    //print(utf8.decode(decr));
  }
}