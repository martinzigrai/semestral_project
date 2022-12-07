import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha3_224p {
  Uint8List sha3Digest(Uint8List dataToDigest){
    final d = SHA3Digest(224);

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha3Digest(utf8.encode(text) as Uint8List);
    print('SHA3-224p: $hash');
  }
}