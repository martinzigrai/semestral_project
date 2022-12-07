import 'package:encrypt/encrypt.dart';


class Aes_cbc_e{
  void getAES(var text) {
    final key = Key.fromUtf8('MartinMartinMart');
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(key,mode:AESMode.cbc, padding:'PKCS7'));

    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.bytes);
  }
}
