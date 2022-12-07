import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha3_256p {
  Uint8List sha256Digest(Uint8List dataToDigest){
    final d = SHA3Digest(256);

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha256Digest(utf8.encode(text) as Uint8List);
    print('SHA3-256p: $hash');
  }
}