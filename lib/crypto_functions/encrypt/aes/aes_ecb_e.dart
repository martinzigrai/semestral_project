import 'package:encrypt/encrypt.dart';

import 'package:benchmark_harness/benchmark_harness.dart';

abstract class Benchmark extends BenchmarkBase {
  const Benchmark(String name) : super(name);
}

class Aes_ecb_e extends Benchmark {
  const Aes_ecb_e(this.name) : super('AES-ecb $name');

  final String name;

  @override
  void run(){
    var message = 'abcdefghijklmnop';
    final key = Key.fromUtf8('MartinMartinMart');
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key,mode:AESMode.ecb, padding:'PKCS7'));

    final encrypted = encrypter.encrypt(message, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    //print(decrypted);
    //print(encrypted.bytes);
  }
}
