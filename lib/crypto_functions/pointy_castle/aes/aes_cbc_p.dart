import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

import 'package:pointycastle/export.dart';

class Aes_cbc_p{

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

  void getAES(var text) {
    final cypher = aesCBCEncrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode('MartinMartinMart') as Uint8List, utf8.encode(text) as Uint8List);
    final decr = aesCBCDecrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode('MartinMartinMart') as Uint8List, cypher);

    print(cypher);
    print(decr);
    print(utf8.decode(decr));
  }
}