import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

import 'package:pointycastle/export.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_cbc_p extends Benchmark{
  const Aes_cbc_p(this.name) : super('AES-cbc - $name');

  final String name;

  Uint8List aesCBCEncrypt(Uint8List key, Uint8List iv, Uint8List paddedPlaintext){
    assert([128, 192, 256].contains(key.length * 8));

    final params = PaddedBlockCipherParameters(ParametersWithIV(KeyParameter(key), iv), null);
    PaddedBlockCipherImpl cbc = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESEngine()));

    cbc.init(true, params);

    return cbc.process(paddedPlaintext);
  }

  Uint8List aesCBCDecrypt(Uint8List key, Uint8List iv, Uint8List cipherText){
    assert([128, 192, 256].contains(key.length * 8));

    final params = PaddedBlockCipherParameters(ParametersWithIV(KeyParameter(key), iv), null);
    PaddedBlockCipherImpl cbc = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESEngine()));

    cbc.init(false, params);

    return cbc.process(cipherText);
  }

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final cypher = aesCBCEncrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode('MartinMartinMart') as Uint8List, utf8.encode(message) as Uint8List);
    final decr = aesCBCDecrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode('MartinMartinMart') as Uint8List, cypher);

    //print(cypher);
    //print(decr);
    //print(utf8.decode(decr));
  }
}