import 'package:encrypt/encrypt.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_cbc_e extends Benchmark {
  const Aes_cbc_e(this.name) : super('AES-cbc $name');

  final String name;

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final key = Key.fromUtf8('MartinMartinMart');
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key,mode:AESMode.cbc, padding:'PKCS7'));

    final encrypted = encrypter.encrypt(message, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    //print(decrypted);
    //print(encrypted.bytes);
  }
}
