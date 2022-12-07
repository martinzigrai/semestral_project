import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha_1p {
  Uint8List sha1Digest(Uint8List dataToDigest){
    final d = SHA1Digest();

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha1Digest(utf8.encode(text) as Uint8List);
    print('SHA-1p: $hash');
  }
}