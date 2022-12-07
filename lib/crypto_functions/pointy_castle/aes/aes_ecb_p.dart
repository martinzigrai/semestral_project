import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';

import 'package:pointycastle/export.dart';

class Aes_ecb_p{

  Uint8List aesECBEncrypt(Uint8List key, Uint8List paddedPlaintext){
    assert([128, 192, 256].contains(key.length * 8));

    final params = PaddedBlockCipherParameters(KeyParameter(key), null);
    PaddedBlockCipherImpl ecb = PaddedBlockCipherImpl(PKCS7Padding(), ECBBlockCipher(AESEngine()));

    ecb.init(true, params);

    return ecb.process(paddedPlaintext);
  }

  Uint8List aesECBDecrypt(Uint8List key, Uint8List cipherText){
    assert([128, 192, 256].contains(key.length * 8));

    final params = PaddedBlockCipherParameters(KeyParameter(key), null);
    PaddedBlockCipherImpl ecb = PaddedBlockCipherImpl(PKCS7Padding(), ECBBlockCipher(AESEngine()));

    ecb.init(false, params);

    return ecb.process(cipherText);
  }

  void getAES(var text) {
    final cypher = aesECBEncrypt(utf8.encode('MartinMartinMart') as Uint8List, utf8.encode(text) as Uint8List);
    final decr = aesECBDecrypt(utf8.encode('MartinMartinMart') as Uint8List, cypher);

    print(cypher);
    print(decr);
    print(utf8.decode(decr));
  }
}