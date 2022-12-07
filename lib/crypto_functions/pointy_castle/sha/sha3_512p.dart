import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha3_512p {
  Uint8List sha512Digest(Uint8List dataToDigest){
    final d = SHA3Digest(512);

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha512Digest(utf8.encode(text) as Uint8List);
    print('SHA3-512p: $hash');
  }
}